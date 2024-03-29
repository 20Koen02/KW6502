E  = %10000000
RW = %01000000
RS = %00100000

init_lcd:
    lda #%11111111 ; Set all pins on port B to output
    sta via_ddrb
    lda #%11100000 ; Set top 3 pins on port A to output
    sta via_ddra

    lda #%00111000 ; Set 8-bit mode; 2-line display; 5x8 font
    jsr lcd_instruction
    lda #%00001100 ; Display on; cursor off; blink off
    jsr lcd_instruction
    lda #%00000110 ; Increment and shift cursor; don't shift display
    jsr lcd_instruction
    lda #$00000001 ; Clear display
    jsr lcd_instruction
    rts

lcd_wait:
    pha
    lda #%00000000  ; Port B is input
    sta via_ddrb
@lcdbusy:
    lda #RW
    sta via_a
    lda #(RW | E)
    sta via_a
    lda via_b
    and #%10000000
    bne @lcdbusy

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

write_lcd:
    pha
    jsr lcd_wait
    sta via_b
    lda #RS         ; Set RS; Clear RW/E bits
    sta via_a
    lda #(RS | E)   ; Set E bit to send instruction
    sta via_a
    lda #RS         ; Clear E bits
    sta via_a
    pla
    rts