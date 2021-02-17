# KW6502 - Koen van Wijngaarden's 6502 Computer

This repository contains some of the work in progress during my build of Ben Eater's inspired 6502 8-bit computer similar 
to typical machines of the early 1980s. If you haven't seen Ben's videos, I would strongly suggest you start there:
[Ben Eater's 6502 project](https://eater.net/6502)


## What is different

Compared to Ben's 6502 build I introduced the following changes:
1. Changed [address decoder logic](Schematics/README.md#address-decoder-change)
2. Added [ACIA chip for serial communication](Schematics/README.md#acia-chip-for-serial-communication)
3. Changed [compiler from VASM to CC65](Schematics/README.md#migration-from-vasm-to-cc65)
4. Changed [system clock to 1.8432 MHz](Schematics/README.md#changed-system-clock)
