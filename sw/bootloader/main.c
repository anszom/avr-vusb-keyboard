/*

   License: GNU GPL v2 (see COPYING)

   Andrzej Szombierski <qq@kuku.eu.org>
   Thomas Fischl <tfischl@gmx.de>

Re-licensed with permission from original author, original notice:

 ***   AVRUSBBoot - USB bootloader for Atmel AVR controllers
 *** 
 ***   Thomas Fischl <tfischl@gmx.de>
 *** 
 ***   License:
 ***   The project is built with AVR USB driver by Objective Development, which is
 ***   published under a proprietary Open Source license. To conform with this
 ***   license, USBasp is distributed under the same license conditions. See
 ***   documentation.
 *** 
 ***   Target.........: ATMega8 at 12 MHz
 ***   Creation Date..: 2006-03-18
 ***   Last change....: 2006-06-25
 *** 
 ***   To adapt the bootloader to your hardware, you have to modify the following files:
 ***   - bootloaderconfig.h:
 *** 	Define the condition when the bootloader should be started
 ***   - usbconfig.h:
 *** 	Define the used data line pins. You have to adapt USB_CFG_IOPORT, USB_CFG_DMINUS_BIT and 
 *** 	USB_CFG_DPLUS_BIT to your hardware. The rest should be left unchanged.
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>
#include <avr/boot.h>
#include <util/delay.h>	 /* for _delay_ms() */

#include "usbdrv.h"
#include "bootloaderconfig.h"

#define USBBOOT_FUNC_WRITE_PAGE 2
#define USBBOOT_FUNC_LEAVE_BOOT 1
#define USBBOOT_FUNC_GET_PAGESIZE 3

#define STATE_IDLE 0
#define STATE_WRITE_PAGE 1

static uchar replyBuffer[8];
static uchar state = STATE_IDLE;
static unsigned int page_address;
static unsigned int page_offset;

void (*jump_to_app)(void) = 0x0000;

void leaveBootloader() {
	  cli();
	  wdt_disable();
	  boot_rww_enable();
	  GICR = (1 << IVCE);  /* enable change of interrupt vectors */
	  GICR = (0 << IVSEL); /* move interrupts to application flash section */
	  jump_to_app();
}

uchar   usbFunctionSetup(uchar data[8])
{
	uchar len = 0;
	
	if (data[1] == USBBOOT_FUNC_LEAVE_BOOT) {
		leaveBootloader();

	} else if (data[1] == USBBOOT_FUNC_WRITE_PAGE) {
		state = STATE_WRITE_PAGE;
		PORTD|=(1<<6);

		page_address = (data[3] << 8) | data[2]; /* page address */
		page_offset = 0;

		eeprom_busy_wait();
		cli();
		boot_page_erase(page_address); /* erase page */
		sei();
		boot_spm_busy_wait(); /* wait until page is erased */

		len = 0xff; /* multiple out */

	} else if (data[1] == USBBOOT_FUNC_GET_PAGESIZE) {
		replyBuffer[0] = SPM_PAGESIZE >> 8;
		replyBuffer[1] = SPM_PAGESIZE & 0xff;
		len = 2;
	}

	usbMsgPtr = (usbMsgPtr_t) replyBuffer;
	return len;
}


uchar usbFunctionWrite(uchar *data, uchar len)
{
	uchar i;

	/* check if we are in correct state */
	if (state != STATE_WRITE_PAGE)
		return 0xff;

	for (i = 0; i < len; i+=2) {
		cli();	
		boot_page_fill(page_address + page_offset, data[i] | (data[i + 1] << 8));
		sei();
		page_offset += 2;

		/* check if we are at the end of a page */
		if (page_offset >= SPM_PAGESIZE) {
			/* write page */
			cli();
			boot_page_write(page_address);
			sei();
			boot_spm_busy_wait();

			PORTD&=~(1<<6);
			state = STATE_IDLE;
			return 1;
		}
	}

	return 0;
}

char bootloader_condition()
{
	unsigned char tmp = MCUCSR;
	MCUCSR=0;
	if(tmp & (1<<WDRF))
		return 1;
	DDRC=0xff;
	PORTC=0x00;
	DDRB=0;
	PORTB=0xff;
	_delay_ms(1);
	return (PINB & 1) == 0;
}

int main(void)
{
	wdt_enable(WDTO_1S);
	/* initialize hardware */

	/* leds */
	DDRD|=1<<6;
	DDRD|=1<<7;

	/* jump to application if key is not pressed */
	if (!bootloader_condition()) {
		leaveBootloader();
	}

	GICR = (1 << IVCE);  /* enable change of interrupt vectors */
	GICR = (1 << IVSEL); /* move interrupts to boot flash section */

	usbInit();
	usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
	unsigned char i = 0;
	while(--i){			 /* fake USB disconnect for > 250 ms */
		wdt_reset();
		_delay_ms(1);
	}
	usbDeviceConnect();
	sei();

	for(i=0;;i++){	/* main event loop */
		_delay_ms(1);
		if(i==0)
			PORTD^=1<<7;
		wdt_reset();
		usbPoll();
	}
	return 0;
}

