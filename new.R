somme <- function(x,n) { 
  if (n<=0) return(1)

  index <- n%%2
  s <- index/x
  f <- 1
  p <- index*x+1-index
  for (i in seq(2+index, n, 2)) { 
    p <- p*x*x
    f <- f*i*(i-1)
    s <- s+f/p
  }
  return(s)
}

x <- 5
n <- 11
somme(x,n)
