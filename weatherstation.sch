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
Sheet 1 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3900 3300 1650 650 
U 563FE165
F0 "USB_IF" 60
F1 "USB_IF.sch" 60
F2 "FTDI_OUT_TXD" O R 5550 3550 60 
F3 "FTDI_IN_RXD" I R 5550 3700 60 
$EndSheet
$Sheet
S 5900 3100 2650 1850
U 564003DD
F0 "ESP_module" 60
F1 "ESP_module.sch" 60
F2 "ESP_GPIO2" B L 5900 4500 60 
F3 "ESP_GPIO12" B L 5900 4650 60 
F4 "ESP_GPIO14" B L 5900 4800 60 
F5 "ESP_IN_RXD" I L 5900 3550 60 
F6 "ESP_OUT_TXD" O L 5900 3700 60 
$EndSheet
$Sheet
S 3450 4300 2100 650 
U 564032BC
F0 "display" 60
F1 "display.sch" 60
F2 "DISP_SCL" T R 5550 4650 60 
F3 "DISP_SDA" T R 5550 4800 60 
F4 "DISP_RST" I R 5550 4500 60 
$EndSheet
Wire Wire Line
	5900 4500 5550 4500
Wire Wire Line
	5550 4650 5900 4650
Wire Wire Line
	5900 4800 5550 4800
Wire Wire Line
	5900 3700 5550 3700
Wire Wire Line
	5900 3550 5550 3550
$EndSCHEMATC
