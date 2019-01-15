Symbol led5 = PORTB.4
Symbol led6 = PORTB.5
Symbol led7 = PORTB.6
Symbol led8 = PORTB.7
Symbol maakschakelaar = PORTA.4
Symbol verbreekschakelaar = PORTA.5

hoofdmenu:
If verbreekschakelaar = 1 Then Goto uit
If maakschakelaar = 1 Then Goto aan
Goto hoofdmenu

uit:
Low PORTB.0
Low PORTB.1
Low PORTB.2
Low PORTB.3
Low led5
Low led6
Low led7
Low led8
Goto hoofdmenu

aan:
High PORTB.0
WaitUs 10
Low PORTB.0
High PORTB.1
WaitUs 10
Low PORTB.1
High PORTB.2
WaitUs 10
Low PORTB.2
High PORTB.3
WaitUs 10
Low PORTB.3
High led5
WaitUs 10
Low led5
High led6
WaitUs 10
Low led6
High led7
WaitUs 10
Low led7
High led8
WaitUs 10
Low led8
If verbreekschakelaar = 1 Then Goto hoofdmenu
Goto aan
