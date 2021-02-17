E  = %10000000
RW = %01000000
RS = %00100000


    .code

reset:
  ldx #$ff
  txs

  lda #%11111111 ; Set all pins on port B to output
  sta via_ddrb
  lda #%11100000 ; Set top 3 pins on port A to output
  sta via_ddra

  lda #%00111000 ; Set 8-bit mode; 2-line display; 5x8 font
  jsr lcd_instruction
  lda #%00001110 ; Display on; cursor on; blink off
  jsr lcd_instruction
  lda #%00000110 ; Increment and shift cursor; don't shift display
  jsr lcd_instruction
  lda #$00000001 ; Clear display
  jsr lcd_instruction

  ; Set up 6551 ACIA
  lda #%00001011 ; No parity, no echo, no interrupt
  sta acia_command
  lda #%00011111 ; 1 stop bit, 8 data bits, 19200 baud
  sta acia_control

  ldx #0
wait_txd_empty:
  lda acia_status
  and #$10
  beq wait_txd_empty
read:
  lda acia_status
  and #$08
  beq read
  lda acia_data
  jsr write_acia
  jsr print_char ; Also send to LCD
  jmp read

nmi:
  rti

irq:
  rti

prefix: .byte "KoenOS> ", $0d, $0a, $00

write_acia:
  sta acia_data
  rts

lcd_wait:
  pha
  lda #%00000000  ; Port B is input
  sta via_ddrb
lcdbusy:
  lda #RW
  sta via_a
  lda #(RW | E)
  sta via_a
  lda via_b
  and #%10000000
  bne lcdbusy

  lda #RW
  sta via_a
  lda #%11111111  ; Port B is output
  sta via_ddrb
  pla
  rts

lcd_instruction:
  jsr lcd_wait
  sta via_b
  lda #0         ; Clear RS/RW/E bits
  sta via_a
  lda #E         ; Set E bit to send instruction
  sta via_a
  lda #0         ; Clear RS/RW/E bits
  sta via_a
  rts

print_char:
  jsr lcd_wait
  sta via_b
  lda #RS         ; Set RS; Clear RW/E bits
  sta via_a
  lda #(RS | E)   ; Set E bit to send instruction
  sta via_a
  lda #RS         ; Clear E bits
  sta via_a
  rts

.segment "ACIA"
    acia_data:     .res 1
    acia_status:   .res 1
    acia_command:  .res 1
    acia_control:  .res 1

.segment "VIA"
    via_b:     .res 1 ; Register "B"
    via_a:     .res 1 ; Register "A"
    via_ddrb:  .res 1 ; Data Direction Register "B"
    via_ddra:  .res 1 ; Data Direction Register "A"
    via_t1c_l: .res 1 ; Read:  T1 Low-Order Counter
                     ; Write: T1 Low-Order Latches
    via_t1c_h: .res 1 ; T1 High-Order Counter
    via_t1l_l: .res 1 ; T1 Low-Order Latches
    via_t1l_h: .res 1 ; T1 High-Order Latches
    via_t2c_l: .res 1 ; Read:  T2 Low-Order Counter
                     ; Write: T2 Low-Order Latches
    via_t2c_h: .res 1 ; T2 High-Order Counter
    via_sr:    .res 1 ; Shift Register
    via_acr:   .res 1 ; Auxilary Control Register
    via_pcr:   .res 1 ; Peripheral Control Register
    via_ifr:   .res 1 ; Interrupt Flag Register
    via_ier:   .res 1 ; Interrupt Enable Register
    via_a_noh: .res 1 ; Same as Register "A" (via_a) except no "Handshake"

.segment "VECTORS"
    .word nmi
    .word reset
    .word irq