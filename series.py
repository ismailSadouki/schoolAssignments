# D03
def series(x, n):
    if (n==0): return 0
    result = 0
    f = 1
    p = 1
    for i in range(1, n+1):
        f = f * i
        p = p*x

        result = f / p + result

    return(result)

x = int(input("Enter x: "))
n = int(input("Enter n: "))

result = series(x, n)
print(f"X: {x}, N: {n}, Result: {result}")
#print(series(5,5))
