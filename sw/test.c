/* simple led-blink program for the keyboard hardware */
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>  /* for sei() */
#include <util/delay.h>     /* for _delay_ms() */

int __attribute__((noreturn)) main(void)
{
	DDRC=0xff;
	PORTC=0;
	DDRD|=1<<6;
	PORTB=0xff;
	for(;;) {
		if(PINB & 1)
			_delay_ms(100);
		_delay_ms(100);
		PORTD^=(1<<6);
	}
}


