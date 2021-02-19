all: hello_world.rom

clean:
	rm -f *.lst *.map *.o *.rom

%.o: src/%.s
	ca65 -o $@ $<

%.rom: %.o ../kw6502.cfg
	ld65 -C ../kw6502.cfg -o build/$@ $<

.PHONY: all clean