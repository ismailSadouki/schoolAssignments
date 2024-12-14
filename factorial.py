# D02
def fact(n):
    if n == 0:
        return(1)
    elif n < 0:
        return("n can't be a negative number")
    elif (not isinstance(n, int)):
        return("n should be an integer")
    f = 1
    for i in range(1, n+1):
        f = f*i
    return(f)

print(fact(3))
