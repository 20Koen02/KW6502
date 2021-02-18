.segment "ZP"
.segment "RAM"

.segment "ACIA"
    acia_data:     .res 1 ; Read: Receiver Data Register - Write: Transmit Data Register
    acia_status:   .res 1 ; Read: Status Register - Write: Programmed Reset (Data is "Don't Care")
    acia_command:  .res 1 ; Command Register
    acia_control:  .res 1 ; Control Register

.segment "VIA"
    via_b:     .res 1 ; Register "B"
    via_a:     .res 1 ; Register "A"
    via_ddrb:  .res 1 ; Data Direction Register "B"
    via_ddra:  .res 1 ; Data Direction Register "A"
    via_t1c_l: .res 1 ; Read: T1 Low-Order Counter - Write: T1 Low-Order Latches
    via_t1c_h: .res 1 ; T1 High-Order Counter
    via_t1l_l: .res 1 ; T1 Low-Order Latches
    via_t1l_h: .res 1 ; T1 High-Order Latches
    via_t2c_l: .res 1 ; Read: T2 Low-Order Counter - Write: T2 Low-Order Latches
    via_t2c_h: .res 1 ; T2 High-Order Counter
    via_sr:    .res 1 ; Shift Register
    via_acr:   .res 1 ; Auxilary Control Register
    via_pcr:   .res 1 ; Peripheral Control Register
    via_ifr:   .res 1 ; Interrupt Flag Register
    via_ier:   .res 1 ; Interrupt Enable Register
    via_a_noh: .res 1 ; Same as Register "A" (via_a) except no "Handshake"

.segment "CODE"
    .include "main.s"

.segment "VECTORS"
    .word nmi
    .word main
    .word irq