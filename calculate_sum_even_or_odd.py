#D05
def calculate_sum(x, n):
    if n <= 0:
        return 1

    odd = n % 2
    even = 1 - odd

    s = odd * 1 / x
    f = odd + even * 2
    p = odd * x + even * x * x

    for i in range(2, n + 1):
        f = f * (2 * i - odd * 2) * (2 * i - 1)
        p = p * x * x
        s = s + f / p

    return s

x = 5
n = 11

result = calculate_sum(x, n)
print(f"The result of the sum is: {result}")

