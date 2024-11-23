# si n pair: 5 + (2+7+3+3)n = 5 + 15n
# si n impair: 5 + (2+9+3+3)n=5+17n
# si n <=0: 2
sum <- function(x, n) {
  if (n<=0) { #1
      return(1) #1
  } else if (n%%2) { #1
    s <- 1/x #2
    f <- 1 #1
    p <- x #1

    for (i in 2:n) { #2
      f <- f * (2 * i - 2) * (2 * i - 1) # 9
      p <- p *x*x #3

      s <- s + f / p # 3
    }
  } else { 
    s <- 0 #1
    f <- 1 #1
    p <- 1 #1

    for (i in 1:n) { #2
      f <- f * (2 * i - 1)*2*i # 7
      p <- p *x*x #3

      s <- s + f / p # 3
    }
  }

  return(s) # 1
}

x <- 5
n <- 11

sum(x, n)




