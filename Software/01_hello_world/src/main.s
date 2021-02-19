    .include "lcd.s"

main:
    ; Initialize LCD
    jsr init_lcd ; lcd.s

    ; Loop through 'message' and print the characters
    ldx #0
print:
    lda message,x ; Load character
    beq exit ; If end of message go to exit
    jsr write_lcd ; Print character
    inx ; Increment Loop Idx
    jmp print

exit:
  jmp exit

message: .asciiz "     KW6502                               Hello World!"

nmi:
    rti

irq:
    rti