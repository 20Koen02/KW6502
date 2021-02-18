    .include "serial.s"

main:
    ; Initialize Serial
    jsr init_serial ; serial.s
    
    ; create read loop
    ldx #0
read:
    jsr read_serial ; read serial
    cpx #$a ; compare x register with a

    bcc continue_writing ; continue if x is less than a (so 0-9)

    ldx #0 ; if not 0-9: reset x

continue_writing:
    txa ; put x in a
    ora #%00110000 ; set correct upper 4 bits to get the correct character codes (logical inclusive or)
    jsr write_serial ; write a (modified index) to serial

    inx
    jmp read
    
nmi:
    rti

irq:
    rti