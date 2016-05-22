#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>  /* for sei() */
#include <util/delay.h>	 /* for _delay_ms() */
#include <avr/eeprom.h>
#include <avr/pgmspace.h>   /* required by usbdrv.h */
#include "usbdrv.h"

// todo:
// Boot interface
// remote wakeup
// see https://github.com/gblargg/adb-v-usb

/* ------------------------------------------------------------------------- */
/* ----------------------------- USB interface ----------------------------- */
/* ------------------------------------------------------------------------- */
/*----------------------------------------------------------*/
/* definition about USB keyboard 		 					*/
/* see : "Device Class Definition for HID v.1.11"			*/ 
/*----------------------------------------------------------*/

#define ReportDescriptor usbHidReportDescriptor
PROGMEM const
#include "hid_descriptor.h"


/* inornate part start ------------------------------------------------------- */

/* USB keyboard report buffer */
static struct ReportBuffer {
	uchar reportId;
	uchar modKey;
	uchar keys[6];
} reportBuffer;

static struct ReportBuffer2 {
	uchar reportId;
	uchar lbits;
	uchar hbits;
} reportBuffer2;

static uchar idleRate;			/* in 4 ms units */
static uchar protocolVer = 1;	/*  0 = boot protocol, 1 = report protocol */
static uchar expectReport;		/* flag to indicate if we expect an USB-report */

/* inornate part end -------------------------------------------------------- */

/* ------------------------------------------------------------------------- */

/* usbFunctionWrite() is called when the host sends a chunk of data to the
 * device. For more information see the documentation in usbdrv/usbdrv.h.
 */
uchar usbFunctionWrite(uchar *data, uchar len)
{
	if (expectReport && (len == 2) && data[0] == 1) {
		if (data[1] & 1) PORTD|=(1<<7);
		else PORTD&=~(1<<7);
		if (data[1] & 2) PORTD|=(1<<6);
		else PORTD&=~(1<<6);
		if (data[1] & 4) PORTD|=(1<<5);
		else PORTD&=~(1<<5);
	}
	expectReport = 0;
	return 1;
}

/* ------------------------------------------------------------------------- */

usbMsgLen_t usbFunctionSetup(uchar data[8])
{
	usbRequest_t	*rq = (void *)data;

	if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS){	/* class request type */
		if(rq->bRequest == USBRQ_HID_GET_REPORT){  /* wValue: ReportType (highbyte), ReportID (lowbyte) */
			if(rq->wValue.word == 0x0101) {
				usbMsgPtr = (usbMsgPtr_t)(uchar *)&reportBuffer;
				return sizeof(reportBuffer);
			} else if(rq->wValue.word == 0x0102) {
				usbMsgPtr = (usbMsgPtr_t)(uchar *)&reportBuffer2;
				return 2;
			}

			return USB_NO_MSG;

		}else if(rq->bRequest == USBRQ_HID_SET_REPORT){ 
			if (rq->wLength.word == 2) {
				/* We expect two-byte reports */
				expectReport = 1;
				return USB_NO_MSG; /* Call usbFunctionWrite with data */
			}

		}else if(rq->bRequest == USBRQ_HID_GET_IDLE){
			usbMsgPtr = (usbMsgPtr_t)&idleRate;
			return 1;

		}else if(rq->bRequest == USBRQ_HID_SET_IDLE){
			idleRate = rq->wValue.bytes[1];
			return USB_NO_MSG;

		} else if (rq->bRequest == USBRQ_HID_SET_PROTOCOL) {
			if (rq->wValue.bytes[1] < 1) {
				protocolVer = rq->wValue.bytes[1];
			}
			return USB_NO_MSG;

		} else if(rq->bRequest == USBRQ_HID_GET_PROTOCOL) {
			usbMsgPtr = (usbMsgPtr_t)&protocolVer;
			return 1;
		}

	}else{
		// any vendor-specific request: reboot-to-bootloader
		wdt_enable(WDTO_15MS);
		for(;;);
	}
	return 0;
}

/* ------------------------------------------------------------------------- */

#define XXXX 0xab

#define M(a) (0xf0 + a)

PROGMEM const uchar characters[18*8] = {
	      /* C0    C1    C2    C3    C4    C5    C6    C7 */
	/*A0*/ 0x91, 0x14, 0x0d, 0x47, 0x4d, 0x4b, 0x4e, 0x51,
	/*A1*/ 0x06, 0x48, 0x49, XXXX, XXXX, XXXX, XXXX, 0xe7,
	/*A2*/ 0x19, 0x3c, 0x1e, 0xe3, XXXX, XXXX, XXXX, XXXX,
	/*A3*/ 0x06, 0x3b, XXXX, XXXX, XXXX, XXXX, 0xe4, M(6),
	/*A4*/ 0x29, 0x3f, 0x21, XXXX, XXXX, M(8), 0xe0, XXXX,
	/*A5*/ XXXX, 0x3d, 0x1f, XXXX, 0xe2, XXXX, M(4), M(7),
	/*A6*/ 0x1b, 0x3a, 0x38, XXXX, M(5), 0xe5, M(2), M(1),
	/*A7*/ 0x1d, 0x2c, 0x37, XXXX, 0xe6, XXXX, M(3), M(0),
	/*B0*/ 0x41, 0x16, 0x2d, 0x18, 0x2f, 0x25, 0x0b, 0x11,
	/*B1*/ 0x42, 0x07, 0x2e, 0x0c, 0x30, 0x26, 0x34, 0x10,
	/*B2*/ 0x43, 0x09, 0x22, 0x12, 0x31, 0x27, XXXX, 0x36,
	/*B3*/ 0x65, 0x1a, 0x0e, 0x53, 0x5f, 0x5c, 0x59, 0x4f,
	/*B4*/ 0x62, 0x08, 0x0f, 0x54, 0x60, 0x5d, 0x5a, 0x62,
	/*B5*/ XXXX, 0x15, 0x33, 0x55, 0x61, 0x5e, 0x5b, 0x63,
	/*B6*/ 0x44, 0x2b, 0x23, 0x62, 0x4a, 0x4c, 0x52, 0x50,
	/*B7*/ 0x28, 0x3e, 0x20, XXXX, XXXX, 0xe1, M(9), XXXX,
	/*D0*/ XXXX, 0x17, 0x2a, 0x56, 0x57, XXXX, 0x58, 0x39,
	/*D1*/ 0x40, 0x04, 0x35, 0x1c, 0x13, 0x24, 0x0a, 0x05,
};

uchar nkeys;
void addKey(uchar index)
{
	uchar code = pgm_read_byte(characters+index);
	if(code >= 0xe0 && code < 0xe8) {
		// modifier keys
		reportBuffer.modKey |= 1 << (code - 0xe0);

	} else if(code >= M(0) && code < M(8)) {
		reportBuffer2.lbits |= 1 << (code - M(0));

	} else if(code >= M(8) && code < M(16)) {
		reportBuffer2.hbits |= 1 << (code - M(8));

	} else {
		if(nkeys == sizeof(reportBuffer.keys))
			return;
//		if(code == 0x0ab)
//			code = index;

		reportBuffer.keys[nkeys++] = code;
	}
}

#undef M

int main(void)
{
	uchar i=250;
	uchar idleCounter = 0;

	wdt_enable(WDTO_1S);
	/* Even if you don't use the watchdog, turn it off here. On newer devices,
	 * the status of the watchdog (on/off, period) is PRESERVED OVER RESET!
	 */

	DDRD|=(1<<5)|(1<<6)|(1<<7);
	PORTD=(1<<5);
	_delay_ms(100);
	PORTD=(1<<6);
	_delay_ms(100);
	PORTD=(1<<7);
	_delay_ms(100);
	PORTD=(1<<6);
	_delay_ms(100);
	PORTD=(1<<5);
	_delay_ms(100);
	PORTD=0;


	/* RESET status: all port bits are inputs without pull-up.
	 * That's the way we need D+ and D-. Therefore we don't need any
	 * additional hardware initialization.
	 */

	usbInit();
	usbDeviceDisconnect();  /* enforce re-enumeration, do this while interrupts are disabled! */
	while(--i){			 /* fake USB disconnect for > 250 ms */
		wdt_reset();
		_delay_ms(1);
	}
	usbDeviceConnect();

	DDRC=0;
	PORTA=0xff;
	PORTB=0xff;
	PORTD|=3;

	uchar keyDidChange = 1;
	uchar check_report_2 = 0;
	uchar reports_updated = 0;
	uchar old_lbits=0, old_hbits=0;
				
	reportBuffer.reportId = 1;
	reportBuffer2.reportId = 2;

	sei();
	for(;;){				/* main event loop */
		uchar q;
		wdt_reset();
		usbPoll();

		static uchar oldrows[18];
		uchar rows[18];
		for(q=0;q<18;q++)
			rows[q]=0;
	
		uchar Z=1;
		for(q=0;q<8;q++,Z=Z<<1) {
			// scan the C port with all high-Z, except for one bit
			// set to low-level
			DDRC=Z;
			PORTC=~Z;
			_delay_us(10); // some settling time
			uchar z,t;

			// transpose the read-out data for easier handling

			// we could scan the A&B&D ports instead, but the
			// D port is shared with USB -> disabling interrupts
			// or some sbi/cbi trickery would be required to avoid
			// collisions with the USB code
			t = PINA;
			for(z=0;z<8;z++,t>>=1) 
				if((t&1)==0) rows[z]|=Z;
			t = PINB;
			for(z=0;z<8;z++,t>>=1) 
				if((t&1)==0) rows[z+8]|=Z;
			t = PIND;
			for(z=0;z<2;z++,t>>=1) 
				if((t&1)==0) rows[z+16]|=Z;
		}

		uchar lockrows[18];
		uchar lockcols=0;
		uchar acc=0;

		// detect key-ghosting scheme
		// we are looking for any row which:
		// 1. has more than one key pressed, and
		// 2. shares any of its pressed keys with any other row
		// This means cases like this:
		//
		//       colU colV
		// rowA:   X   X
		// rowB:   X   ?
		//
		// To avoid reporting ghost keys, we 'lock' the offending
		// rows and columns, keeping reporting old values for them
		// until the condition resolves itself.

		// Condition (1) is checked in two passes, looping over the
		// rows in both directions.
		
		// Condition (2) is checked using binary tricks.
#define morethan1bit(a) ((a-1)&a)

		for(q=0;q<18;q++) {
			lockrows[q] = 0;
			uchar t = rows[q];

			// detect if the row shares any of the bits with any of
			// the lower-numbered rows (accumulated in acc)
			if((t & acc) && morethan1bit(t)) {
				lockrows[q] = 1;
				lockcols |= t;
			}
			acc |= t;
		}
		acc=0;
		for(q=17;;q--) {
			uchar t = rows[q];
			// detect if the row shares any of the bits with any of
			// the higher-numbered rows (accumulated in acc)
			if((t & acc) && morethan1bit(t)) {
				lockrows[q] = 1;
				lockcols |= t;
			}
			acc |= t;
			if(q==0)
				break;
		}
	
		// If a transient effect made us register an electrically
		// impossible case like this:
		//       colU colV
		// rowA:   X   X
		// rowB:   X  off 
		//
		// Then only rowA will be marked as locked.
		// The following loop will catch also rowB, since it shres
		// a key with a locked column colU
		for(q=0;q<18;q++) 
			if(rows[q] & lockcols)
				lockrows[q] = 1;

		for(q=0;q<18;q++) {
			if(lockrows[q])
				rows[q] = oldrows[q];
			else {
				rows[q] = (oldrows[q] & lockcols) | (rows[q] & ~lockcols);
				if(oldrows[q] != rows[q])
					keyDidChange = 1;
				oldrows[q] = rows[q];
			}
		}

		if (TIFR & _BV(TOV0)) {		/* 4ms period expired */ 
			TIFR = _BV(TOV0);
			if(idleRate != 0){
				if(idleCounter > 0){
					idleCounter--;
				} else{
					idleCounter = idleRate;
					keyDidChange = 1;
				}
			}
		}

		if(usbInterruptIsReady()) {
			if(keyDidChange) {
				reportBuffer.modKey = 0;
				reportBuffer2.lbits = reportBuffer2.hbits = 0;
				nkeys=0;
				// fill in the report buffer if required
				for(q=0;q<18;q++) {
					uchar z;
					uchar t = rows[q];
					for(z=q*8;t;z++,t>>=1) 
						if(t&1) 
							addKey(z);
				}
				
				for(q=nkeys;q<sizeof(reportBuffer.keys);q++)
					reportBuffer.keys[q]=0;

				// always send reportBuffer
				reports_updated |= 1;

				// send reportBuffer2 only if changed
				if(reportBuffer2.lbits != old_lbits || reportBuffer2.hbits != old_hbits)
					reports_updated |= 2;
			
				old_lbits = reportBuffer2.lbits;
				old_hbits = reportBuffer2.hbits;

				keyDidChange = 0;
			}

			if(check_report_2 && (reports_updated & 2)) {
				usbSetInterrupt((uchar *)&reportBuffer2, sizeof(reportBuffer2));
				check_report_2 = 0;
				reports_updated &= ~2;
				continue;
			}

			if(reports_updated & 1) {
				usbSetInterrupt((uchar *)&reportBuffer, sizeof(reportBuffer));
				check_report_2 = 1;
				reports_updated &= ~1;
				continue;
			}

			if(reports_updated & 2) {
				usbSetInterrupt((uchar *)&reportBuffer2, sizeof(reportBuffer2));
				check_report_2 = 0;
				reports_updated &= ~2;
				continue;
			}
		}
	}

	return 0;
}

/* ------------------------------------------------------------------------- */
