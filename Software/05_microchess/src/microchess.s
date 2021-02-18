.segment "ZP"
    BOARD   = $50 
    BK      = $60 
    PIECE   = $B0 
    SQUARE  = $B1 
    SP2     = $B2 
    SP1     = $B3 
    INCHEK  = $B4 
    STATE   = $B5 
    MOVEN   = $B6 
    REV		= $B7
    OMOVE   = $DC 
    WCAP0   = $DD 
    COUNT   = $DE 
    BCAP2   = $DE 
    WCAP2   = $DF 
    BCAP1   = $E0 
    WCAP1   = $E1 
    BCAP0   = $E2 
    MOB     = $E3 
    MAXC    = $E4 
    CC      = $E5 
    PCAP    = $E6 
    BMOB    = $E3 
    BMAXC   = $E4 
    BMCC    = $E5
    BMAXP   = $E6 
    XMAXC   = $E8 
    WMOB    = $EB 
    WMAXC   = $EC 
    WCC     = $ED 
    WMAXP   = $EE 
    PMOB    = $EF 
    PMAXC   = $F0 
    PCC     = $F1 
    PCP     = $F2 
    OLDKY   = $F3 
    BESTP   = $FB 
    BESTV   = $FA 
    BESTM   = $F9 
    DIS1    = $FB 
    DIS2    = $FA 
    DIS3	= $F9 
    temp	= $FC
    tempy	= $FD

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