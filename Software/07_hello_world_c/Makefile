C_SOURCES = hello_world_c.c
ASM_SOURCES = startup.s65 lcd.s65

# Default target
all: hello_world_c.rom

# Compilation of C files
%.o: %.c
	cc65 --cpu 6502 -O -t none -o $(@:.o=.s) $<
	ca65 --cpu 6502 -o $@ -l $(@:.o=.lst) $(<:.c=.s)

# Compilation of assembler files
%.o: %.s65
	ca65 --cpu 6502 -o $@ -l $(@:.o=.lst) $<

# Build the firmware binary
%.rom: $(ASM_SOURCES:.s65=.o) $(C_SOURCES:.c=.o)
	cl65 -C ../kw6502.cfg -m hello_world_c.map -o build/$@ $^ ../cc65.lib
	del -f *.s *.o *.lst *.map

# Clean up
clean:
	del -f *.s *.o *.lst *.map
