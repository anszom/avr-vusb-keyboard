EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:kbd-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "25 aug 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA16-A IC1
U 1 1 55D4D5D7
P 6350 3900
F 0 "IC1" H 5400 5780 40  0000 L BNN
F 1 "ATMEGA16-A" H 6850 1950 50  0000 L BNN
F 2 "TQFP44" H 6350 3900 30  0000 C CIN
F 3 "" H 6350 3900 60  0000 C CNN
	1    6350 3900
	1    0    0    -1  
$EndComp
$Comp
L CONN_8 P2
U 1 1 55D4D637
P 8050 4350
F 0 "P2" V 8000 4350 60  0000 C CNN
F 1 "CONN_8" V 8100 4350 60  0000 C CNN
F 2 "" H 8050 4350 60  0000 C CNN
F 3 "" H 8050 4350 60  0000 C CNN
	1    8050 4350
	1    0    0    -1  
$EndComp
$Comp
L CONN_18 P3
U 1 1 55D4D7E0
P 8950 3050
F 0 "P3" V 8900 3050 60  0000 C CNN
F 1 "CONN_18" V 9000 3050 60  0000 C CNN
F 2 "" H 8950 3000 60  0000 C CNN
F 3 "" H 8950 3000 60  0000 C CNN
	1    8950 3050
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 55D4D7EF
P 4750 2800
F 0 "X1" H 4750 2950 60  0000 C CNN
F 1 "12MHz" H 4750 2650 60  0000 C CNN
F 2 "~" H 4750 2800 60  0000 C CNN
F 3 "~" H 4750 2800 60  0000 C CNN
	1    4750 2800
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 55D4D808
P 3850 2400
F 0 "C1" H 3850 2500 40  0000 L CNN
F 1 "27p" H 3856 2315 40  0000 L CNN
F 2 "~" H 3888 2250 30  0000 C CNN
F 3 "~" H 3850 2400 60  0000 C CNN
	1    3850 2400
	0    1    1    0   
$EndComp
$Comp
L C C3
U 1 1 55D4D81B
P 4750 1550
F 0 "C3" H 4750 1650 40  0000 L CNN
F 1 "100n" H 4756 1465 40  0000 L CNN
F 2 "~" H 4788 1400 30  0000 C CNN
F 3 "~" H 4750 1550 60  0000 C CNN
	1    4750 1550
	1    0    0    -1  
$EndComp
$Comp
L CAPAPOL C4
U 1 1 55D4D823
P 5050 1550
F 0 "C4" H 5100 1650 40  0000 L CNN
F 1 "10u" H 5100 1450 40  0000 L CNN
F 2 "~" H 5150 1400 30  0000 C CNN
F 3 "~" H 5050 1550 300 0000 C CNN
	1    5050 1550
	1    0    0    -1  
$EndComp
$Comp
L LED D3
U 1 1 55D4D832
P 10050 5000
F 0 "D3" H 10050 5100 50  0000 C CNN
F 1 "LED" H 10050 4900 50  0000 C CNN
F 2 "~" H 10050 5000 60  0000 C CNN
F 3 "~" H 10050 5000 60  0000 C CNN
	1    10050 5000
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 55D4D83F
P 10050 5350
F 0 "D4" H 10050 5450 50  0000 C CNN
F 1 "LED" H 10050 5250 50  0000 C CNN
F 2 "~" H 10050 5350 60  0000 C CNN
F 3 "~" H 10050 5350 60  0000 C CNN
	1    10050 5350
	1    0    0    -1  
$EndComp
$Comp
L LED D5
U 1 1 55D4D845
P 10050 5650
F 0 "D5" H 10050 5750 50  0000 C CNN
F 1 "LED" H 10050 5550 50  0000 C CNN
F 2 "~" H 10050 5650 60  0000 C CNN
F 3 "~" H 10050 5650 60  0000 C CNN
	1    10050 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 55D4D84D
P 3550 2400
F 0 "#PWR01" H 3550 2400 30  0001 C CNN
F 1 "GND" H 3550 2330 30  0001 C CNN
F 2 "" H 3550 2400 60  0000 C CNN
F 3 "" H 3550 2400 60  0000 C CNN
	1    3550 2400
	0    1    1    0   
$EndComp
$Comp
L C C2
U 1 1 55D4D864
P 3850 3200
F 0 "C2" H 3850 3300 40  0000 L CNN
F 1 "27p" H 3856 3115 40  0000 L CNN
F 2 "~" H 3888 3050 30  0000 C CNN
F 3 "~" H 3850 3200 60  0000 C CNN
	1    3850 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR02
U 1 1 55D4D86A
P 3550 3200
F 0 "#PWR02" H 3550 3200 30  0001 C CNN
F 1 "GND" H 3550 3130 30  0001 C CNN
F 2 "" H 3550 3200 60  0000 C CNN
F 3 "" H 3550 3200 60  0000 C CNN
	1    3550 3200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR03
U 1 1 55D4D893
P 6150 6100
F 0 "#PWR03" H 6150 6100 30  0001 C CNN
F 1 "GND" H 6150 6030 30  0001 C CNN
F 2 "" H 6150 6100 60  0000 C CNN
F 3 "" H 6150 6100 60  0000 C CNN
	1    6150 6100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR04
U 1 1 55D4D90D
P 4400 1000
F 0 "#PWR04" H 4400 960 30  0001 C CNN
F 1 "+3.3V" H 4400 1110 30  0000 C CNN
F 2 "" H 4400 1000 60  0000 C CNN
F 3 "" H 4400 1000 60  0000 C CNN
	1    4400 1000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 55D4D9E1
P 4900 1900
F 0 "#PWR05" H 4900 1900 30  0001 C CNN
F 1 "GND" H 4900 1830 30  0001 C CNN
F 2 "" H 4900 1900 60  0000 C CNN
F 3 "" H 4900 1900 60  0000 C CNN
	1    4900 1900
	1    0    0    -1  
$EndComp
Text Label 7900 5100 0    60   ~ 0
D+
Text Label 7900 5200 0    60   ~ 0
D-
$Comp
L R R1
U 1 1 55D4DAFB
P 2500 2000
F 0 "R1" V 2580 2000 40  0000 C CNN
F 1 "68R" V 2507 2001 40  0000 C CNN
F 2 "~" V 2430 2000 30  0000 C CNN
F 3 "~" H 2500 2000 30  0000 C CNN
	1    2500 2000
	0    -1   -1   0   
$EndComp
$Comp
L R R3
U 1 1 55D4DB08
P 3550 1900
F 0 "R3" V 3630 1900 40  0000 C CNN
F 1 "68R" V 3557 1901 40  0000 C CNN
F 2 "~" V 3480 1900 30  0000 C CNN
F 3 "~" H 3550 1900 30  0000 C CNN
	1    3550 1900
	0    -1   -1   0   
$EndComp
Text Label 2850 2000 0    60   ~ 0
D+
Text Label 3900 1900 0    60   ~ 0
D-
$Comp
L R R2
U 1 1 55D4DC00
P 3250 1500
F 0 "R2" V 3330 1500 40  0000 C CNN
F 1 "1K5" V 3257 1501 40  0000 C CNN
F 2 "~" V 3180 1500 30  0000 C CNN
F 3 "~" H 3250 1500 30  0000 C CNN
	1    3250 1500
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR06
U 1 1 55D4DDEC
P 2050 2300
F 0 "#PWR06" H 2050 2300 30  0001 C CNN
F 1 "GND" H 2050 2230 30  0001 C CNN
F 2 "" H 2050 2300 60  0000 C CNN
F 3 "" H 2050 2300 60  0000 C CNN
	1    2050 2300
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55D4E91D
P 9450 5000
F 0 "R4" V 9530 5000 40  0000 C CNN
F 1 "100R" V 9457 5001 40  0000 C CNN
F 2 "~" V 9380 5000 30  0000 C CNN
F 3 "~" H 9450 5000 30  0000 C CNN
	1    9450 5000
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 55D4E92A
P 9450 5350
F 0 "R5" V 9530 5350 40  0000 C CNN
F 1 "100R" V 9457 5351 40  0000 C CNN
F 2 "~" V 9380 5350 30  0000 C CNN
F 3 "~" H 9450 5350 30  0000 C CNN
	1    9450 5350
	0    -1   -1   0   
$EndComp
$Comp
L R R6
U 1 1 55D4E930
P 9450 5650
F 0 "R6" V 9530 5650 40  0000 C CNN
F 1 "100R" V 9457 5651 40  0000 C CNN
F 2 "~" V 9380 5650 30  0000 C CNN
F 3 "~" H 9450 5650 30  0000 C CNN
	1    9450 5650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR07
U 1 1 55D4E936
P 10350 5800
F 0 "#PWR07" H 10350 5800 30  0001 C CNN
F 1 "GND" H 10350 5730 30  0001 C CNN
F 2 "" H 10350 5800 60  0000 C CNN
F 3 "" H 10350 5800 60  0000 C CNN
	1    10350 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2600 5250 2400
Wire Wire Line
	5250 2400 4050 2400
Wire Wire Line
	4750 2500 4750 2400
Connection ~ 4750 2400
Wire Wire Line
	5250 3000 5250 3200
Wire Wire Line
	5250 3200 4050 3200
Wire Wire Line
	4750 3100 4750 3200
Connection ~ 4750 3200
Wire Wire Line
	3650 3200 3550 3200
Wire Wire Line
	3650 2400 3550 2400
Wire Wire Line
	6050 5900 6050 6000
Wire Wire Line
	6050 6000 6450 6000
Wire Wire Line
	6250 6000 6250 5900
Wire Wire Line
	6150 5900 6150 6100
Connection ~ 6150 6000
Wire Wire Line
	6450 6000 6450 5900
Connection ~ 6250 6000
Wire Wire Line
	3150 1150 6150 1150
Wire Wire Line
	4400 1150 4400 1000
Wire Wire Line
	6150 1150 6150 1900
Connection ~ 4400 1150
Wire Wire Line
	6050 1750 6450 1750
Wire Wire Line
	6050 1750 6050 1900
Connection ~ 6150 1750
Wire Wire Line
	6250 1750 6250 1900
Wire Wire Line
	6450 1750 6450 1900
Connection ~ 6250 1750
Wire Wire Line
	4900 1900 4900 1850
Wire Wire Line
	4750 1850 5050 1850
Wire Wire Line
	4750 1850 4750 1750
Wire Wire Line
	5050 1850 5050 1750
Connection ~ 4900 1850
Wire Wire Line
	4750 1350 4750 1150
Connection ~ 4750 1150
Wire Wire Line
	5050 1350 5050 1150
Connection ~ 5050 1150
Wire Wire Line
	7450 5100 7900 5100
Wire Wire Line
	7900 5200 7450 5200
Wire Wire Line
	2000 1900 3300 1900
Wire Wire Line
	2750 2000 2850 2000
Wire Wire Line
	3800 1900 3900 1900
Wire Wire Line
	3250 1250 3250 1150
Connection ~ 3250 1150
Wire Wire Line
	3250 1900 3250 1750
Connection ~ 3250 1900
Wire Wire Line
	2050 2100 2050 2300
Wire Wire Line
	2050 2100 2000 2100
Wire Wire Line
	9700 5000 9850 5000
Wire Wire Line
	9850 5350 9700 5350
Wire Wire Line
	9700 5650 9850 5650
Wire Wire Line
	10350 5800 10350 5000
Wire Wire Line
	10350 5000 10250 5000
Wire Wire Line
	10250 5350 10350 5350
Connection ~ 10350 5350
Wire Wire Line
	10250 5650 10350 5650
Connection ~ 10350 5650
Wire Wire Line
	5250 2200 5100 2200
Wire Wire Line
	7450 3800 8500 3800
Wire Wire Line
	7450 3700 8450 3700
Wire Wire Line
	7450 3600 8400 3600
Wire Wire Line
	8600 3900 8600 5000
Wire Wire Line
	8600 5000 7450 5000
Wire Wire Line
	7450 4900 8550 4900
Wire Wire Line
	8550 4900 8550 3800
Wire Wire Line
	8550 3800 8600 3800
Wire Wire Line
	8600 3700 8500 3700
Wire Wire Line
	8500 3700 8500 3800
Wire Wire Line
	8600 3600 8450 3600
Wire Wire Line
	8450 3600 8450 3700
Wire Wire Line
	8600 3500 8400 3500
Wire Wire Line
	8400 3500 8400 3600
Wire Wire Line
	8600 3400 8350 3400
Wire Wire Line
	8350 3400 8350 3500
Wire Wire Line
	8350 3500 7450 3500
Wire Wire Line
	8600 3300 8300 3300
Wire Wire Line
	8300 3300 8300 3400
Wire Wire Line
	8300 3400 7450 3400
Wire Wire Line
	8600 3200 8250 3200
Wire Wire Line
	8250 3200 8250 3300
Wire Wire Line
	8250 3300 7450 3300
Wire Wire Line
	8600 3100 8200 3100
Wire Wire Line
	8200 3100 8200 3200
Wire Wire Line
	8200 3200 7450 3200
Wire Wire Line
	8600 3000 8150 3000
Wire Wire Line
	8150 3000 8150 3100
Wire Wire Line
	8150 3100 7450 3100
Wire Wire Line
	7450 4000 7700 4000
Wire Wire Line
	7450 4100 7700 4100
Wire Wire Line
	7450 4200 7700 4200
Wire Wire Line
	7450 4300 7700 4300
Wire Wire Line
	7450 4400 7700 4400
Wire Wire Line
	7450 4500 7700 4500
Wire Wire Line
	7450 4600 7700 4600
Wire Wire Line
	7450 4700 7700 4700
Wire Wire Line
	7450 5600 9200 5600
Wire Wire Line
	9200 5600 9200 5650
Wire Wire Line
	7450 5500 9200 5500
Wire Wire Line
	9200 5500 9200 5350
Wire Wire Line
	7450 5400 9150 5400
Wire Wire Line
	9150 5400 9150 5000
Wire Wire Line
	9150 5000 9200 5000
Wire Wire Line
	7450 2900 7500 2900
Wire Wire Line
	7500 2900 7500 2850
Wire Wire Line
	7500 2850 8550 2850
Wire Wire Line
	8550 2850 8550 2200
Wire Wire Line
	8550 2200 8600 2200
Wire Wire Line
	7450 2800 7500 2800
Wire Wire Line
	7500 2800 7500 2750
Wire Wire Line
	7500 2750 8500 2750
Wire Wire Line
	8500 2750 8500 2300
Wire Wire Line
	8500 2300 8600 2300
Wire Wire Line
	7450 2700 7500 2700
Wire Wire Line
	7500 2700 7500 2650
Wire Wire Line
	7500 2650 8450 2650
Wire Wire Line
	8450 2650 8450 2400
Wire Wire Line
	8450 2400 8600 2400
Wire Wire Line
	7450 2600 7500 2600
Wire Wire Line
	7500 2600 7500 2550
Wire Wire Line
	7500 2550 8400 2550
Wire Wire Line
	8400 2550 8400 2500
Wire Wire Line
	8400 2500 8600 2500
Wire Wire Line
	7450 2500 8350 2500
Wire Wire Line
	8350 2500 8350 2600
Wire Wire Line
	8350 2600 8600 2600
Wire Wire Line
	7450 2400 8300 2400
Wire Wire Line
	8300 2400 8300 2700
Wire Wire Line
	8300 2700 8600 2700
Wire Wire Line
	7450 2300 8250 2300
Wire Wire Line
	8250 2300 8250 2800
Wire Wire Line
	8250 2800 8600 2800
Wire Wire Line
	7450 2200 8200 2200
Wire Wire Line
	8200 2200 8200 2900
Wire Wire Line
	8200 2900 8600 2900
$Comp
L CONN_5 P1
U 1 1 55D64FF1
P 1600 2000
F 0 "P1" V 1550 2000 50  0000 C CNN
F 1 "CONN_5" V 1650 2000 50  0000 C CNN
F 2 "" H 1600 2000 60  0000 C CNN
F 3 "" H 1600 2000 60  0000 C CNN
	1    1600 2000
	-1   0    0    -1  
$EndComp
NoConn ~ 2000 2200
$Comp
L CONN_1 P4
U 1 1 55D6522C
P 4950 2200
F 0 "P4" H 5030 2200 40  0000 L CNN
F 1 "CONN_1" H 4950 2255 30  0001 C CNN
F 2 "" H 4950 2200 60  0000 C CNN
F 3 "" H 4950 2200 60  0000 C CNN
	1    4950 2200
	-1   0    0    1   
$EndComp
$Comp
L LD1117A U1
U 1 1 55D854AF
P 2750 1200
F 0 "U1" H 2550 1400 40  0000 C CNN
F 1 "LD1117A" H 2750 1400 40  0000 L CNN
F 2 "SOT-223" H 2750 1300 30  0000 C CIN
F 3 "" H 2750 1200 60  0000 C CNN
	1    2750 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1800 2000 1800
Wire Wire Line
	2250 1100 2250 1800
Wire Wire Line
	2000 1150 2350 1150
Wire Wire Line
	2250 2000 2000 2000
$Comp
L +5V #PWR08
U 1 1 55D8D1DB
P 2250 1100
F 0 "#PWR08" H 2250 1190 20  0001 C CNN
F 1 "+5V" H 2250 1190 30  0000 C CNN
F 2 "" H 2250 1100 60  0000 C CNN
F 3 "" H 2250 1100 60  0000 C CNN
	1    2250 1100
	1    0    0    -1  
$EndComp
Connection ~ 2250 1150
$Comp
L CAPAPOL C5
U 1 1 55D8D37A
P 2000 1400
F 0 "C5" H 2050 1500 40  0000 L CNN
F 1 "10u" H 2050 1300 40  0000 L CNN
F 2 "~" H 2100 1250 30  0000 C CNN
F 3 "~" H 2000 1400 300 0000 C CNN
	1    2000 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 55D8D380
P 2000 1700
F 0 "#PWR09" H 2000 1700 30  0001 C CNN
F 1 "GND" H 2000 1630 30  0001 C CNN
F 2 "" H 2000 1700 60  0000 C CNN
F 3 "" H 2000 1700 60  0000 C CNN
	1    2000 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 1700 2000 1600
Wire Wire Line
	2000 1150 2000 1200
$Comp
L GND #PWR010
U 1 1 55D8D6F7
P 2750 1600
F 0 "#PWR010" H 2750 1600 30  0001 C CNN
F 1 "GND" H 2750 1530 30  0001 C CNN
F 2 "" H 2750 1600 60  0000 C CNN
F 3 "" H 2750 1600 60  0000 C CNN
	1    2750 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1600 2750 1450
NoConn ~ 5250 3400
$EndSCHEMATC