'컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴
' Michal Wallace
' Tesselation Program
'컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴

c% = 0
SCREEN 13
FOR x% = 0 TO 280 STEP 20
 FOR y% = 0 TO 160 STEP 20
  c% = c% + 1: IF c% > 135 THEN c% = 1
  PSET (x%, y%), c%
  DRAW "f5 d10 g5 r5 f3 r5 e2 r5 e5 u10 h5 l5 g2 l5 h3 l5 bd5 br15"
  PAINT STEP(0, 0), c%
 NEXT y%
NEXT x%

redo: PALETTE INT(RND * 135) + 1, 65536 * INT(RND * 63) + 256 * INT(RND * 63) + INT(RND * 63) + 65793
IF LEN(INKEY$) = 0 THEN GOTO redo

