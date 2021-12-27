# INTIALIZING NODE and IT'S WEIGHT
nodeDict = { (1,2):5, (2,4):3, (2,5):2, (1,3):4 }
nodeList = [ (1,2), (2,4), (2,5), (1,3) ]

#INPUT STARTING AND ENDING NODE
s = int(input("Starting  Node: "))
e = int(input("Ending  Node: "))

#DETERMINE PATH LENGTH
def path (s, e, weight=0):
    if (s, e) in nodeList:
        print(f"Total Path Length = {weight + nodeDict[(s, e)]} ")
    
    for (i, j) in nodeList:
        if i == s:
            path(j, e, weight + nodeDict[(i, j)])

#CALL RECURSIVE FUNCTION
path(s,e)

