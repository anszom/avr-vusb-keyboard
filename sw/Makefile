VUSB=vusb-20121206

CC=avr-gcc
CFLAGS=-Os -mmcu=atmega16 -DF_CPU=12000000 -Wall -g -I$(VUSB)/usbdrv -I.
LDFLAGS=-mmcu=atmega16 -g

default: main.hex test.hex
clean:
	rm -f *.o *.hex *.elf

main.elf: main.o usbdrv.o usbdrvasm.o
	$(CC) -o $@ $^ $(LDFLAGS)

test.elf: test.o
	$(CC) -o $@ $^ $(LDFLAGS)

usbdrv.o: $(VUSB)/usbdrv/usbdrv.c
	$(CC) -c -o $@ $< $(CFLAGS)

usbdrvasm.o: $(VUSB)/usbdrv/usbdrvasm.S
	$(CC) -c -o $@ $< $(CFLAGS)

%.hex: %.elf
	avr-objcopy -O ihex $< $@
