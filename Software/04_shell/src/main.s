    .include "lcd.s"
    .include "serial.s"

main:
    ; Initialize LCD and Serial
    jsr init_lcd ; lcd.s
    jsr init_serial ; serial.s
    ; jsr wait_tx ; serial.s

read:
    jsr read_serial ; wait for data and load in a

    jsr write_serial ; Send to ACIA
    
    cmp #%01111111 ; Compare loaded data to Backspace
    beq write_lcd_backspace

    jsr write_lcd ; Send to LCD
    jmp read
    
write_lcd_backspace:
    jsr backspace_lcd
    jmp read


nmi:
    rti

irq:
    rti