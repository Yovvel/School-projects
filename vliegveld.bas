'****************************************************************
'*  Name    : UNTITLED.BAS                                      *
'*  Author  : Joffel                                            *
'*  Notice  : Copyright (c) 2008 joffel                         *
'*          : All Rights Reserved                               *
'*  Date    : 17-6-2008                                         *
'*  Version : 1.0                                               *
'*  Notes   :                                                   *
'*          :                                                   *
'****************************************************************
DEVICE 16F628A                ;Gebruik een 16F628A type
CONFIG INTRC_OSC_NOCLKOUT, WDT_OFF, PWRTE_ON, LVP_OFF, MCLRE_OFF
ALL_DIGITAL TRUE              ;Alle ingangen digitaal

SYMBOL LED1 = PORTA.0         ;Poort A.0 heeft nu de naam LED1
SYMBOL LED2 = PORTA.1         ;Poort A.1 heeft nu de naam LED2
SYMBOL LED3 = PORTA.2         ;Poort A.2 heeft nu de naam LED3
Symbol LED4 = porta.3
symbol LED5 = porta.6
symbol LED6 = PORTA.7

SYMBOL S1   = PORTB.0         ;Poort B.0 heeft nu de naam S1
SYMBOL S2   = PORTB.1         ;Poort B.1 heeft nu de naam S2
SYMBOL S3   = PORTB.2         ;Poort B.2 heeft nu de naam S3
dim Teller as byte
dim Gate1bezet as byte
dim Gate2bezet as byte


PORTB_PULLUPS ON              ;On-chip pull-up weerstanden actief
CLEAR                         ;Wis alle RAM geheugen

high led2
high led4
high led6


Landen:
teller = 0
if s1 = 0 then goto gatecontrol
if s3 = 0 then goto gatewait
goto landen

Landen2:
low led2
if gate1bezet = 1 then goto gatebezetcontrol1
if gate2bezet = 1 then goto gatebezetcontrol2

Gatebezetcontrol1:
if gate2bezet = 1 then goto landen
goto gate2

Gatebezetcontrol2:
if gate1bezet = 1 then goto landen
goto gate1



Gatecontrol:
low led2
high led1
if s2 = 0 then goto gate22
if gate1bezet = 0 then goto gate11
if gate1bezet = 1 then goto gate22

Gate11:
if gate2bezet = 0 then goto gate2
goto landen

Gate22:
if gate2bezet = 0 then goto gate2
goto landen

Gate1:
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
low led1
high led2
while teller <5
toggle led3
toggle led4
delayms 500
teller = teller + 1
wend
high led3
low led4
gate1bezet = 1
goto Wacht

Wacht:
teller = 0
if s1 = 0 then goto landen2
If s3 = 0 then goto gatewait
goto wacht

Gatewait:
if s2 = 0 then goto gate2wait
goto gate1wait

Gate1wait:
gate1bezet = 0
if s3 = 0 then goto gate1wait1
goto gate1wait

Gate1wait1:
low led1
high led2
while teller <5
toggle led3
toggle led4
delayms 500
teller = teller + 1
wend
low led3
high led4
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
low led1
high led2
goto landen

Gate2:
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
low led1
high led2
while teller <5
toggle led5
toggle led6
delayms 500
teller = teller + 1
wend
high led5
low led6
gate2bezet = 1
goto wacht

Gate2wait:
gate2bezet = 0
if s3 = 0 then goto gate2wait2
goto gate2wait

Gate2wait2:
low led1
high led2
while teller <5
toggle led5
toggle led6
delayms 500
teller = teller + 1
wend
low led5
high led6
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
toggle led1
delayms 250
low led1
high led2
goto landen

end
