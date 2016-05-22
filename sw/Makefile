VUSB=vusb-20121206

CC=avr-gcc
CFLAGS=-Os -mmcu=atmega16 -DF_CPU=12000000 -Wall -g -I$(VUSB)/usbdrv -I.
CFLAGS_BOOT=-Os -mmcu=atmega16 -DF_CPU=12000000 -Wall -g -I$(VUSB)/usbdrv -Ibootloader
LDFLAGS=-mmcu=atmega16 -g
BOOTLOADER_ADDRESS = 3800
LDFLAGS_BOOT = $(LDFLAGS) -Wl,--section-start=.text=$(BOOTLOADER_ADDRESS)

default: main.hex bootloader.hex test.hex
clean:
	rm -f *.o *.hex *.elf

main.elf: main.o usbdrv.o usbdrvasm.o
	$(CC) -o $@ $^ $(LDFLAGS)

bootloader.elf: bootloader.o bl-usbdrv.o bl-usbdrvasm.o
	$(CC) -o $@ $^ $(LDFLAGS_BOOT)

test.elf: test.o
	$(CC) -o $@ $^ $(LDFLAGS)

bootloader.o: bootloader/main.c
	$(CC) -c -o $@ $< $(CFLAGS_BOOT)

usbdrv.o: $(VUSB)/usbdrv/usbdrv.c
	$(CC) -c -o $@ $< $(CFLAGS)

usbdrvasm.o: $(VUSB)/usbdrv/usbdrvasm.S
	$(CC) -c -o $@ $< $(CFLAGS)

bl-usbdrv.o: $(VUSB)/usbdrv/usbdrv.c
	$(CC) -c -o $@ $< $(CFLAGS_BOOT)

bl-usbdrvasm.o: $(VUSB)/usbdrv/usbdrvasm.S
	$(CC) -c -o $@ $< $(CFLAGS_BOOT)

%.hex: %.elf
	avr-objcopy -O ihex $< $@
