# 6502 System Software

This documentation provides necessary insight into software provided in the repository.

## Projects

1. [LCD Test](01_lcd_test): This program puts "Hello, world!" on the LCD
2. [Serial Test](02_serial_test): This program reads and writes to the serial monitor.
3. [Serial and LCD](03_serial_and_lcd): This program reads from the serial monitor and output it on both the lcd and serial monitor
4. WIP [Shell](04_shell): This program creates a shell on both the lcd and serial monitor.
5. [MicroChess](05_microchess): Microchess for the Kim-1 was the first game program sold for home computers. After six months of development, the first copy was shipped on December 18, 1976.
6. [Button Test](06_button_test): This program listens for button presses and runs different code for every button
7. [Hello World C](07_hello_world_c): This program is written in C and puts "Hello, world!" on the LCD
8. [Microsoft Basic](08_ms_basic): OSI 6502 BASIC VERSION 1.0 REV 3.2, COPYRIGHT 1977 BY MICROSOFT CO.


## Setting up development environment on MacOS

```
brew install minipro cc65
```

To write a bin file to the eeprom use this command: `minipro -p AT28C256 -w rom.bin`


## Setting up development environment on Windows

One important thing to note is that you might need to install FTDI Virtual COM Port drivers.

You will need the cc65 compiler toolchain. Click on "Windows Snapshot" at the bottom on this page https://cc65.github.io/.
Extract the contents of the zip to a folder - I chose `C:\cc65` - and [add this folder to your path](https://www.architectryan.com/2018/03/17/add-to-the-path-on-windows-10/)

To flash the eeprom I use the TL866II Plus programmer. [You can find it's software here](http://forums.xgecu.com/viewthread.php?tid=20&page=1&extra=#pid23)

For serial communication you can use regular PuTTy, but it doesn't have the feature of sending files using XModem protocol,
so it's really recommended to use ExtraPuTTy instead.

## Running the simplest possible program

Now you need to build the first program. Go to `Software/01_lcd_test` folder and run:

```sh
make
```

You can find the binary file here: `Software/01_lcd_test/build/lcd_test.rom`
