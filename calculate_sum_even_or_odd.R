# The Time complexity of the function calculate_sum:
# 17+(2+10+3+3+1)n + 1 = 18 + 19n
calculate_sum <- function(x, n) {
  if (n<=0) return(1) #2

  odd <- n%%2 #2
  even <- 1 - odd #2

  s <- odd*1/x #3
  f <- odd + even*2 #3
  p <- odd*x + even*x*x #5

  for (i in 2:n) { #2
    f <- f * (2*i-odd*2)*(2*i-1) #10

    p <- p*x*x #3

    s <- s + f / p #3
  }

  return(s) #1
}

x <- 5
n <- 10

result <- calculate_sum(x, n)
cat("The result of the sum is:", result, "\n")




