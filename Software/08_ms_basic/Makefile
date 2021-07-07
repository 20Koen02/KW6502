all: osi_bas.rom

clean:
	rm -f *.lst *.map *.o *.rom

%.o: src/%.s
	ca65 -o $@ $<

%.rom: %.o kw6502_basic.cfg
	ld65 -C kw6502_basic.cfg -o build/$@ $<

.PHONY: all clean