'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : Joffre Notling                                    *
'*  Notice  : Copyright (c) 2007 Joffel                         *
'*          : All Rights Reserved                               *
'*  Date    : 26-6-2007                                         *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************
DEVICE 16F628A                ;We gebruiken een 16F628A type
CONFIG INTRC_OSC_NOCLKOUT, WDT_OFF, PWRTE_ON, LVP_OFF, MCLRE_OFF
ALL_DIGITAL TRUE

clear
symbol Led1 = porta.0         ;porta 0 is led 1
symbol Led2 = porta.1         ;porta 1 is led 2
symbol Led3 = porta.2         ;porta 2 is led 3
symbol Led4 = porta.3         ;porta 3 is led 4
symbol Led5 = porta.6         ;porta 4 is led 5
symbol Led6 = porta.7         ;porta 5 is led 6

symbol S1 = portb.0           ;portb 0 is schakelaar 1
symbol S2 = portb.1           ;portb 1 is schakelaar 2
symbol S3 = portb.2           ;portb 2 is schakelaar 3
symbol S4 = portb.3           ;portb 3 is schakelaar 4
symbol S5 = portb.4           ;portb 4 is schakelaar 5
symbol S6 = portb.5           ;portb 5 is schakelaar 6
symbol S7 = portb.6           ;portb 6 is schakelaar 7
symbol S8 = portb.7           ;portb 7 is schakelaar 8

symbol aan = 0                ;Schakelaar aan = laag (0)
symbol uit = 1                ; schakelaar uit = hoog (1)

PORTB_PULLUPS ON              ;On-chip pull-up weerstanden actief
CLEAR                         ;Wis alle RAM geheugen
trisa = 00000000
goto main

main:
porta = 00000000
if s1 = aan then goto inschakelen
goto main
end

Inschakelen:
DIM Teller AS BYTE            ;Variabele aanmaken (BYTE kan tellen van 0 t/m 255)

FOR Teller = 1 TO 100          ;Tel van 8 tot en met 20
select teller
case <100
high led6
delayms 100
low led6
delayms 100
case 100
goto main
endselect
next
