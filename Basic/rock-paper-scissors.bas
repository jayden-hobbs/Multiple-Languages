10 PRINT "Welcome to Rock-Paper-Scissors!"
20 PRINT "Enter your choice (rock, paper, or scissors):"
30 INPUT USERCHOICE$
40 USERCHOICE$ = LCASE$(USERCHOICE$)
50 CHOICES(1) = "rock"
60 CHOICES(2) = "paper"
70 CHOICES(3) = "scissors"
80 RANDOMIZE TIMER
90 COMPCHOICE = INT(RND * 3) + 1
100 PRINT "Computer chose: "; CHOICES(COMPCHOICE)
110 IF USERCHOICE$ = CHOICES(COMPCHOICE) THEN GOTO 140
120 IF (USERCHOICE$ = "rock" AND CHOICES(COMPCHOICE) = "scissors") OR (USERCHOICE$ = "paper" AND CHOICES(COMPCHOICE) = "rock") OR (USERCHOICE$ = "scissors" AND CHOICES(COMPCHOICE) = "paper") THEN GOTO 160
130 GOTO 180
140 PRINT "It's a tie!"
150 GOTO 200
160 PRINT "You win!"
170 GOTO 200
180 PRINT "You lose!"
200 PRINT "Do you want to play again? (yes/no):"
210 INPUT PLAYAGAIN$
220 PLAYAGAIN$ = LCASE$(PLAYAGAIN$)
230 IF PLAYAGAIN$ = "yes" THEN GOTO 20
240 PRINT "Thanks for playing!"
250 END