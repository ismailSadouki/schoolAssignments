def calculate_sum(x, n):
    s = 1/x
    f = 1
    p = x
    for i in range(2, n):
        f = f*(2*i-2)*(2*i-1)
        p = p*x*x
        s = s+f/p
    return(s)

result = calculate_sum(5, 10)
print(result)





def fact(n):
    while n<0:
        n = int(input('enter n:'))
    F = 1
    if n>1:
        for i in range(1, int(n)+1):
            F = F*i
    return(F)

print(fact(3))
