
init_serial:
    sta acia_status ; Programmed Reset (Data is "Don't Care")
    lda #%00001011 ; No parity, no echo, no interrupt
    sta acia_command
    lda #%00011111 ; 1 stop bit, 8 data bits, 19200 baud
    sta acia_control
    rts

read_serial:
    lda acia_status
    and #%00001000
    beq read_serial
    lda acia_data
    rts

write_serial:
    pha
@wait_tx_empty:
    lda acia_status
    and #%00010000
    beq @wait_tx_empty

    pla
    sta acia_data ; Send to ACIA
    rts