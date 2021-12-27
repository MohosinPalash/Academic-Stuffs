#RECURSIVE FUNCTION TO FIND THE SUM OF SERIES.
def seriesSum (n, a, d):
    if n==1:
        return a
    else:
        return seriesSum(n-1, a+d, d)

#INUPUT N, a (First Term) and d (interval)
n = int(input("Number of terms: "))
a = int(input("The first Term: "))
d = int(input("Interval: "))

#VALIDATION AND PRINT RESULT
if n<=0:
    print("Not a valid input")
else:
    print("The sum of the series is = ", seriesSum(n, a, d))


