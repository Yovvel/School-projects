Symbol startknop = PORTA.5
Symbol stopknop = PORTA.6
Symbol sensor = PORTA.7
Symbol proces = PORTB.0
Symbol indicatie = PORTB.1  'als de schakeling stop staat
Symbol motor = PORTB.2
Symbol cilinder = PORTB.3

High indicatie

begin:
If startknop = 1 Then Goto motorstart
If stopknop = 1 Then Goto motorstop
If sensor = 1 Then Goto knipper
Goto begin

motorstart:
Low indicatie
High motor
Goto begin

motorstop:
High indicatie
Low motor
Goto begin

knipper:
While sensor = 1
Toggle cilinder
WaitUs 50
Wend
Low cilinder
Goto begin


End                                               
