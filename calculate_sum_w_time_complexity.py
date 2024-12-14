# D04
# Time complexity: O(n)
def calculate_sum(x, n):
    s = 1 / x
    f = 1
    p = x

    for i in range(2, n + 1):  
        f = f * (2 * i - 2) * (2 * i - 1)  
        p = p * x * x  
        s = s + f / p 

    return s

x = 5
n = 10

result = calculate_sum(x, n)
print(f"The result of the sum is: {result}")
