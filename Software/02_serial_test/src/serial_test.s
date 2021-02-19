.segment "ACIA"
    acia_data:     .res 1 ; Read: Receiver Data Register - Write: Transmit Data Register
    acia_status:   .res 1 ; Read: Status Register - Write: Programmed Reset (Data is "Don't Care")
    acia_command:  .res 1 ; Command Register
    acia_control:  .res 1 ; Control Register

.segment "CODE"
    .include "main.s"


.segment "VECTORS"
    .word nmi
    .word main
    .word irq