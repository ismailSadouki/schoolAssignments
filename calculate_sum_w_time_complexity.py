# Time complexity: O(n)
def calculate_sum(x, n):
    s = 0
    f = 1
    p = 1

    for i in range(1, n+1):
        f = f * i
        p = p * x

        s = s + f / p
        print(s)

    return s

x = 5
n = 10

result = calculate_sum(x, n)
print("The result of the sum is:", result)
