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

![Address Compare Image](../blob/main/Schematics/address-compare.png?raw=true)

| Segment | BE6502        | KW6502        |
|---------|---------------|---------------|
| RAM     | 0x0000-0x3fff | 0x0000-0x5fff |
| ACIA    |               | 0x6000        |
| VIA     | 0x6000        | 0x7000        |
| ROM     | 0x8000-0xffff | 0x8000-0xffff |