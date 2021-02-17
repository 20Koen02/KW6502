# 6502 System Schematics

This documentation provides all the information regarding my variant of BE6502 computer

*The schematic schematic is work in progress*

## Deviations from Ben Eater's design
This section describes details of each deviation from original BE6502 design.


### Address decoder change
As Ben explained in his video, there are many ways to handle address decoding logic and he opted for model with 16K RAM,
8K VIA shadow and 32K ROM. He does note that it's a bit of a waste, 
but given the simplicity of the project it should not be a problem - and he is absolutely right.

I wanted more with my build. I wanted to test my understanding of how address decoding works.
My build provides 24K RAM, 4K VIA shadow, 4K ACIA shadow and 32K ROM.

<img src="./address-compare.png?raw=true" width="800px" alt="Address Compare Image">

| Segment | BE6502        | KW6502        |
|---------|---------------|---------------|
| RAM     | 0x0000-0x3fff | 0x0000-0x5fff |
| ACIA    |               | 0x6000        |
| VIA     | 0x6000        | 0x7000        |
| ROM     | 0x8000-0xffff | 0x8000-0xffff |


### ACIA chip for serial communication
This one is really important - thanks to the ACIA chip all the input/output can be handled by the serial port.
This expansion allows you to output infinite amounts of data to your serial monitor, so you're no longer limited by the tiny LCD.
You can also input all sorts of data, like keyboard input or even files using the XMODEM protocol.


### Migration from VASM to CC65
As much as I liked VASM for small, simple projects, it became quite cumbersome to use when I wanted to introduce
different addressing models. CC65 is basically much better compiler for anything 6502.


### Changed System Clock
I changed the system clock from 1 MHz to 1.8432 MHz. 
I did this because the ACIA chip needs this specific clock speed anyways, so why not use it for the whole system