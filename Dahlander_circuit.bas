'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : Joffrey Nolting                                   *
'*  Notice  : Copyright (c) 2007 Joffel                         *
'*          : All Rights Reserved                               *
'*  Date    : 26-6-2007                                         *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************

DEVICE 16F628A                ;We gebruiken een 16F628A type
CONFIG INTRC_OSC_NOCLKOUT, WDT_OFF, PWRTE_ON, LVP_OFF, MCLRE_OFF
ALL_DIGITAL TRUE              ;Alle ingangen digitaal

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
trisa = %00000000
goto main
Main:
porta = %00000000
IF s1 = aan then goto linksom1
if s7 = aan then goto rechtsom1
if s3 = aan then goto linksoma
if s5 = aan then goto rechtsoma
goto  main
end

Main1:
low led2
delayms 2000
low led1
goto main
end

Main2:
low led3
delayms 2000
low led4
goto main
end

Linksom1:
high led1
delayms 2000
high led2
if s2 = aan then goto main1
if s7 = aan then goto rechtsom2
goto linksom1
end

Linksom2:
low led3
delayms 2000
low led4
delayms 2000
goto linksom1
end

LinksomA:
high led1
delayms 2000
if s4 = aan then goto linksomb
goto linksoma
end

LinksomB:
high led2
if s2 = aan then goto main1
goto linksomb
end

Rechtsom1:
high led4
delayms 2000
high led3
if s2 = aan then goto main2
if s1 = aan then goto linksom2
goto rechtsom1
end

Rechtsom2:
low led2
delayms 2000
low led1
delayms 2000
goto rechtsom1
end

RechtsomA:
high led4
delayms 2000
if s6 = aan then goto rechtsomb
goto rechtsoma
end

RechtsomB:
high led3
if s2 = aan then goto main2
goto rechtsomb
end
