'John Conway's Game of Life
'Original was programmed by Ben Wagner

RANDOMIZE TIMER

' MODIFIED:  matrix(now%,,) is the current compute, matrix(NOT now%,,) is the next iteration

DIM matrix(-1 TO 0, -1 TO 81, -1 TO 81) AS INTEGER

now% = 0

'Randomize the current cells matrix(now%,,)

y% = 0
DO
	x% = 0
   
	DO
		x% = x% + 1
		matrix(now%, x%, y%) = INT(RND - .5)

	LOOP UNTIL x% > 80
		
	y% = y% + 1

LOOP UNTIL y% > 80


SCREEN 9, 0, 0, 1
WINDOW (0, 0)-(80, 80)


'Main Loop
DO

'Counts the surrounding cell tally%
'apply the Rules to the cell

y% = 0

CLS

DO
	x% = 0
	DO
		tally% = 0

		IF matrix(now%, x% - 1, y% + 1) THEN tally% = tally% + 1
		IF matrix(now%, x%, y% + 1) THEN tally% = tally% + 1
		IF matrix(now%, x% + 1, y% + 1) THEN tally% = tally% + 1
		IF matrix(now%, x% - 1, y%) THEN tally% = tally% + 1
		IF matrix(now%, x% + 1, y%) THEN tally% = tally% + 1
		IF matrix(now%, x% - 1, y% - 1) THEN tally% = tally% + 1
		IF matrix(now%, x%, y% - 1) THEN tally% = tally% + 1
		IF matrix(now%, x% + 1, y% - 1) THEN tally% = tally% + 1

		'draw output, and death for too lonely or too crowded
		IF matrix(now%, x%, y%) THEN
			LINE (x%, y%)-(x% + 1, y% + 1), 1, BF
			IF tally% < 2 OR tally% > 3 THEN matrix(NOT now%, x%, y%) = 0 ELSE matrix(NOT now%, x%, y%) = -1
		END IF

		'birth
		IF NOT matrix(now%, x%, y%) THEN
			IF tally% = 3 THEN matrix(NOT now%, x%, y%) = -1 ELSE matrix(NOT now%, x%, y%) = 0
		END IF

		x% = x% + 1

	LOOP UNTIL x% > 80
	   
	y% = y% + 1

LOOP UNTIL y% > 80

PCOPY 0, 1

'the next iteration matrix become the current matrix, and continues..

now% = NOT now%

LOOP UNTIL LEN(INKEY$)
