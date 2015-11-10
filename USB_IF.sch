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
LIBS:ESP8266
LIBS:ft232rl
LIBS:weatherstation-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FT232RL U?
U 1 1 563FE286
P 4050 3700
F 0 "U?" H 3300 4900 60  0000 C CNN
F 1 "FT232RL" H 4050 3700 60  0000 C CNN
F 2 "" H 4050 3700 60  0000 C CNN
F 3 "" H 4050 3700 60  0000 C CNN
	1    4050 3700
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 563FE2C9
P 3150 1750
F 0 "C?" H 3175 1850 50  0000 L CNN
F 1 "100n" H 3175 1650 50  0000 L CNN
F 2 "" H 3188 1600 30  0000 C CNN
F 3 "" H 3150 1750 60  0000 C CNN
	1    3150 1750
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 563FE30A
P 3500 1750
F 0 "C?" H 3525 1850 50  0000 L CNN
F 1 "10u" H 3525 1650 50  0000 L CNN
F 2 "" H 3538 1600 30  0000 C CNN
F 3 "" H 3500 1750 60  0000 C CNN
	1    3500 1750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 563FE3C3
P 6900 2950
F 0 "R?" V 6980 2950 50  0000 C CNN
F 1 "1k" V 6900 2950 50  0000 C CNN
F 2 "" V 6830 2950 30  0000 C CNN
F 3 "" H 6900 2950 30  0000 C CNN
	1    6900 2950
	1    0    0    -1  
$EndComp
$Comp
L USB_OTG P?
U 1 1 563FE402
P 1700 2100
F 0 "P?" H 2025 1975 50  0000 C CNN
F 1 "USB_OTG" H 1700 2300 50  0000 C CNN
F 2 "" V 1650 2000 60  0000 C CNN
F 3 "" V 1650 2000 60  0000 C CNN
	1    1700 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1800 2400 1800 3250
Wire Wire Line
	1800 3250 2950 3250
Wire Wire Line
	2950 3400 1700 3400
Wire Wire Line
	1700 3400 1700 2400
Wire Wire Line
	1900 2400 1900 2950
Wire Wire Line
	1900 2950 2950 2950
Wire Wire Line
	4200 5200 4200 5100
Wire Wire Line
	3750 5200 4350 5200
Wire Wire Line
	4050 5200 4050 5100
Wire Wire Line
	3900 5100 3900 5400
Connection ~ 4050 5200
$Comp
L GNDPWR #PWR?
U 1 1 563FE6D9
P 3900 5400
F 0 "#PWR?" H 3900 5200 50  0001 C CNN
F 1 "GNDPWR" H 3900 5270 50  0000 C CNN
F 2 "" H 3900 5350 60  0000 C CNN
F 3 "" H 3900 5350 60  0000 C CNN
	1    3900 5400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 563FE720
P 2300 2800
F 0 "#PWR?" H 2300 2650 50  0001 C CNN
F 1 "+5V" H 2300 2940 50  0000 C CNN
F 2 "" H 2300 2800 60  0000 C CNN
F 3 "" H 2300 2800 60  0000 C CNN
	1    2300 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2950 2300 2800
Connection ~ 2300 2950
Connection ~ 3900 5200
$Comp
L GNDPWR #PWR?
U 1 1 563FE7A1
P 1500 2550
F 0 "#PWR?" H 1500 2350 50  0001 C CNN
F 1 "GNDPWR" H 1500 2420 50  0000 C CNN
F 2 "" H 1500 2500 60  0000 C CNN
F 3 "" H 1500 2500 60  0000 C CNN
	1    1500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2400 1500 2550
$Comp
L GNDPWR #PWR?
U 1 1 563FE975
P 3300 2100
F 0 "#PWR?" H 3300 1900 50  0001 C CNN
F 1 "GNDPWR" H 3300 1970 50  0000 C CNN
F 2 "" H 3300 2050 60  0000 C CNN
F 3 "" H 3300 2050 60  0000 C CNN
	1    3300 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 563FE997
P 3300 1400
F 0 "#PWR?" H 3300 1250 50  0001 C CNN
F 1 "+5V" H 3300 1540 50  0000 C CNN
F 2 "" H 3300 1400 60  0000 C CNN
F 3 "" H 3300 1400 60  0000 C CNN
	1    3300 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1400 3300 1500
Connection ~ 3300 1500
Wire Wire Line
	3300 2000 3300 2100
Connection ~ 3300 2000
Wire Wire Line
	3150 1600 3150 1500
Wire Wire Line
	3150 1500 3500 1500
Wire Wire Line
	3500 1500 3500 1600
Wire Wire Line
	3500 2000 3500 1900
Wire Wire Line
	3150 2000 3500 2000
Wire Wire Line
	3150 1900 3150 2000
$Comp
L LED D?
U 1 1 563FEAD6
P 6900 3450
F 0 "D?" H 6900 3550 50  0000 C CNN
F 1 "LED" H 6900 3350 50  0000 C CNN
F 2 "" H 6900 3450 60  0000 C CNN
F 3 "" H 6900 3450 60  0000 C CNN
	1    6900 3450
	0    1    1    0   
$EndComp
$Comp
L LED D?
U 1 1 563FEE17
P 6550 3450
F 0 "D?" H 6550 3550 50  0000 C CNN
F 1 "LED" H 6550 3350 50  0000 C CNN
F 2 "" H 6550 3450 60  0000 C CNN
F 3 "" H 6550 3450 60  0000 C CNN
	1    6550 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	6550 3650 6550 4000
Wire Wire Line
	6900 3650 6900 4150
$Comp
L R R?
U 1 1 563FEF80
P 6550 2950
F 0 "R?" V 6630 2950 50  0000 C CNN
F 1 "1k" V 6550 2950 50  0000 C CNN
F 2 "" V 6480 2950 30  0000 C CNN
F 3 "" H 6550 2950 30  0000 C CNN
	1    6550 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3250 6550 3100
Wire Wire Line
	6900 3250 6900 3100
$Comp
L +5V #PWR?
U 1 1 563FF179
P 6550 2700
F 0 "#PWR?" H 6550 2550 50  0001 C CNN
F 1 "+5V" H 6550 2840 50  0000 C CNN
F 2 "" H 6550 2700 60  0000 C CNN
F 3 "" H 6550 2700 60  0000 C CNN
	1    6550 2700
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 563FF1A1
P 6900 2700
F 0 "#PWR?" H 6900 2550 50  0001 C CNN
F 1 "+5V" H 6900 2840 50  0000 C CNN
F 2 "" H 6900 2700 60  0000 C CNN
F 3 "" H 6900 2700 60  0000 C CNN
	1    6900 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2800 6550 2700
Wire Wire Line
	6900 2800 6900 2700
Text HLabel 5550 2800 2    60   Output ~ 0
FTDI_OUT_TXD
Text HLabel 5550 2950 2    60   Input ~ 0
FTDI_IN_RXD
$Comp
L R R?
U 1 1 563FF62A
P 5350 2800
F 0 "R?" V 5430 2800 50  0000 C CNN
F 1 "10R" V 5350 2800 50  0000 C CNN
F 2 "" V 5280 2800 30  0000 C CNN
F 3 "" H 5350 2800 30  0000 C CNN
	1    5350 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 2800 5200 2800
Wire Wire Line
	5500 2800 5550 2800
Wire Wire Line
	5150 2950 5550 2950
Wire Wire Line
	6550 4000 5150 4000
Wire Wire Line
	6900 4150 5150 4150
Wire Wire Line
	4350 5200 4350 5100
Connection ~ 4200 5200
Wire Wire Line
	3750 5100 3750 5200
Wire Wire Line
	2950 2800 2700 2800
Wire Wire Line
	2700 2800 2700 4600
Wire Wire Line
	2700 4600 2950 4600
NoConn ~ 5150 3100
NoConn ~ 5150 3250
NoConn ~ 5150 3400
NoConn ~ 5150 3550
NoConn ~ 5150 3700
NoConn ~ 5150 3850
NoConn ~ 5150 4300
NoConn ~ 5150 4450
NoConn ~ 5150 4600
NoConn ~ 2950 4150
NoConn ~ 2950 4000
NoConn ~ 2950 3700
NoConn ~ 1600 2400
NoConn ~ 1300 2000
$EndSCHEMATC
