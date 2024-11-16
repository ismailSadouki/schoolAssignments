# The Time complexity of the function calculate_sum: 4 + (2+9+3)n + 1 = 14n+4 = O(n)
calculate_sum <- function(x, n) {
  s <- 1/x #2
  f <- 1 #1
  p <- x #1

  for (i in 2:n) { #2
    f <- f * (2 * i - 2) * (2 * i - 1) # 9
    p <- p *x*x #3

    s <- s + f / p # 3
  }

  return(s) # 1
}

x <- 5
n <- 10

result <- calculate_sum(x, n)
cat("The result of the sum is:", result, "\n")



