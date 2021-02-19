.segment "ZEROPAGE"
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