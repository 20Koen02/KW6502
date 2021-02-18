    .include "lcd.s"
    .include "serial.s"

main:
    ; Initialize LCD and Serial
    jsr init_lcd ; lcd.s
    jsr init_serial ; serial.s

read:
    jsr read_serial ; Wait until data is received and store in a

    jsr write_serial ; Send to ACIA
    jsr write_lcd ; Send to LCD
    jmp read


nmi:
    rti

irq:
    rti