# 6502 System Software

This documentation provides necessary insight into software provided in the repository.

## Projects

1. [LCD Test](01_lcd_test): This program puts "Hello, world!" on the LCD
2. [Serial Test](02_serial_test): This program reads and writes to the serial monitor.
3. [Serial and LCD](03_serial_and_lcd): This program reads from the serial monitor and output it on both the lcd and serial monitor
4. WIP [Shell](04_shell): This program creates a shell on both the lcd and serial monitor.

## Setting up development environment on Windows

One important thing to note is that you might need to install FTDI Virtual COM Port drivers.

You need to install [Cygwin](https://cygwin.com/), but while installing, 
make sure you add the following packages: `python2`, `pkg-config`, `git`, `make`, `gcc-core`. 
This should be enough to clone the `cc65` repository, and after building make sure
to issue `make avail` and `make install` to enable invocation from command line.

For serial communication you can use regular PuTTy, but it doesn't have the feature of sending files using XModem protocol,
so it's really recommended to use ExtraPuTTy instead.

## Running the simplest possible program

Now you need to build the first program. Go to `Software/rom/01_nop_fill` folder and run:

```sh
make clean all test
```

You can find the binary file here: `Software/build/rom/01_nop_fill.kw.bin`

## Building software

General rule is simple: `make` should be sufficient for all the build/installation. The following `make` targets are to be used for building software:

- `all` - build the project
- `clean` - delete all temporary files
