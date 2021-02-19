    .include "lcd.s"

main:
    jsr init_lcd ; lcd.s - initialize lcd
    jsr lcd_custom_chars

funcn:
    jsr getkey
left:
    lda switch
    cmp #%00001110
    bne top
    lda #%01111111
    jsr write_lcd
    jmp funcn

top:
    lda switch
    cmp #%00001101
    bne right
    lda #%00000000
    jsr write_lcd
    jmp funcn

right:
    lda switch
    cmp #%00001011
    bne down
    lda #%01111110
    jsr write_lcd
    jmp funcn

down:
    lda switch
    cmp #%00000111
    bne unknown
    lda #%00000001
    jsr write_lcd
    jmp funcn

unknown:
    lda #'?'
    jsr write_lcd
    jmp funcn


; Subroutines
getkey:
    lda via_a           ; read switches
    and #%00001111      ; mask out other bits
    cmp #%00001111      ; no keys pushed?
    beq getkey          ; check again...
    sta switch          ; store value read
@again:
    lda via_a           ; wait for key up
    and #%00001111      ; mask out other bits
    cmp #%00001111      ; no keys pushed?
    bne @again           ; check again...
    rts

lcd_custom_chars:
    lda #%01000000 ; First Custom CGRAM Character
    jsr lcd_instruction

    ; Arrow Up
    lda #%00000000
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00001110
    jsr write_lcd
    lda #%00010101
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00000000
    jsr write_lcd
    lda #%00000000
    jsr write_lcd

    ; Arrow Down
    lda #%00000000
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00010101
    jsr write_lcd
    lda #%00001110
    jsr write_lcd
    lda #%00000100
    jsr write_lcd
    lda #%00000000
    jsr write_lcd
    lda #%00000000
    jsr write_lcd

    lda #%10000000 ; Go back to writing to visible display
    jsr lcd_instruction
    rts

nmi:
    rti

irq:
    rti