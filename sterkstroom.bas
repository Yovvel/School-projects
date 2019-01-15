'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : Joffrey Nolting                                   *
'*  Notice  : Copyright (c) 2007 Joffel                         *
'*          : All Rights Reserved                               *
'*  Date    : 26-6-2007                                         *
'*  Version : 1.0                                               *
'*  Notes   :  programma om 2 lampen op 230V te schakelen       *
'*          :                                                   *
'****************************************************************
DEVICE 16F628A                ;We gebruiken een 16F628A type
CONFIG INTRC_OSC_NOCLKOUT, WDT_OFF, PWRTE_ON, LVP_OFF, MCLRE_OFF
ALL_DIGITAL TRUE
clear

symbol Led1 = porta.6         ;porta 4 is led 5
symbol Led2 = porta.7         ;porta 5 is led 6

symbol S1 = portb.0           ;portb 0 is schakelaar 1
symbol S2 = portb.1           ;portb 1 is schakelaar 2
symbol S3 = portb.2           ;portb 2 is schakelaar 3
symbol S4 = portb.3           ;portb 3 is schakelaar 4
symbol S5 = portb.4           ;portb 4 is schakelaar 5
symbol S6 = portb.5           ;portb 5 is schakelaar 6
symbol S7 = portb.6           ;portb 6 is schakelaar 7
symbol S8 = portb.7           ;portb 7 is schakelaar 8

symbol aan = 0                ;Schakelaar aan = laag (0)
symbol uit = 1                ;Schakelaar uit = hoog (1)

DIM Teller1 AS BYTE
DIM Teller2 AS BYTE
dim Teller3 as byte
dim Teller4 as byte
dim Teller5 as byte
dim teller6 as byte

PORTB_PULLUPS ON              ;On-chip pull-up weerstanden actief
CLEAR                         ;Wis alle RAM geheugen
trisa = 00000000
goto main

Main:
porta = 00000000
if s1 = aan then goto schakeling1
IF S2 = aan then goto schakeling2
if s3 = aan then goto schakeling3
if s4 = aan then goto schakeling4
if s5 = aan then goto schakeling5
if s6 = aan then goto schakeling6
if s7 = aan then goto schakeling7
goto main
end

Schakeling1:
FOR Teller1 = 1 TO 3
select teller1
case <3
high led1
delayms 1000
low led1
high led2
delayms 1000
low led2
case 3
goto main
endselect
next
end

Schakeling2:
For teller2 = 1 to 5
Select teller2
case <5
high led1
high led2
delayms 350
low led1
delayms 350
low led2
delayms 350
high led2
delayms 350
low led2
case 5
goto main
endselect
next
end

Schakeling3:
for teller3 = 1 to 10
select teller3
case <10
high led1
delayms 200
low led1
high led2
delayms 200
low led2
case 10
goto main
endselect
next
end

Schakeling4:
for teller4 = 1 to 20
select teller4
case <20
high led1
delayms 100
low led1
high led2
delayms 100
low led2
case 20
goto main
endselect
next
end

Schakeling5:
for teller5 = 1 to 12
select teller5
case <12
toggle led1
delayms 200
case 12
goto main
endselect
next
end

Schakeling6:
for teller6 = 1 to 12
select teller6
case <12
toggle led2
delayms 200
case 12
goto main
endselect
next
end

Schakeling7:
toggle led1
delayms 200
toggle led1
delayms 200
toggle led1
delayms 200
toggle led1
toggle led2
delayms 200
toggle led2
delayms 200
toggle led2
delayms 200
toggle led2
delayms 200
toggle led1
toggle led2
delayms 200
toggle led1
toggle led2
goto main
end
