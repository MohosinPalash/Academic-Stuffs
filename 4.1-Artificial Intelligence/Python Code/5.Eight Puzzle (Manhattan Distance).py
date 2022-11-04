#GOAL TUPLE
gtp=[(1,1,1), (2,1,2), (3,1,3), (4,2,3), (5,3,3), (6,3,2), (7,3,1), (8,2,1)]

#CURRENT TUPLE
tp=[(1,1,2), (2,1,3), (3,2,1), (4,2,3), (5,3,3), (6,2,2), (7,3,2), (8,1,1)]

i=0
totalDistance=0

#DETERMINE MANHATTAN DISTANCE FOR 8 PUZZLES
while(i<=7):
    if((gtp[i][1] != tp[i][1]) or (gtp[i][2] != tp[i][2])):
        distance = abs( gtp[i][1] - tp[i][1]) + abs( gtp[i][2] - tp[i][2])
        totalDistance= totalDistance + distance
    i=i+1


print("Manhattan Distnace : ",totalDistance)
