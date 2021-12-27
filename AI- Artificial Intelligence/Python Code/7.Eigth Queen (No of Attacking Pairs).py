#QUEENS POSITION INITIALIZATION
QueensPos = [ (2,5), (3,1), (3,6), (4,4), (6,1), (6,6) ]

attackingPair = 0
i=0

#TO PRINT PAIRS
## print(QueensPos[i][0], " ",QueensPos[i][1], "    ",QueensPos[j][0], " ",QueensPos[j][1])

#DETERMINE ATTACKING PAIRS   
while(i<len(QueensPos)):
    j=0
    while(j<len(QueensPos)):
        if(i==j):
          pass
        elif( (QueensPos[i][0] == QueensPos[j][0]) or
              ( (QueensPos[i][0] - QueensPos[i][1]) == (QueensPos[j][0] - QueensPos[j][1]) ) or
              ( (QueensPos[i][0] + QueensPos[i][1]) == (QueensPos[j][0] + QueensPos[j][1]) ) ):
            attackingPair = attackingPair + 1
        j = j+1
    i = i+1

print("Number od Attacking Pairs = ", int(attackingPair/2))
    
