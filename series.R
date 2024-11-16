

# Time Complexity: O(n)
factorial <- function(n = 0) { 
  if (n == 0) { 
      return(1)
  } else if (n<0) { 
      stop("n can't be a negative number")
  } else if (!(floor(n)==n)) { 
      stop("n should be an integer")
  }

  f <-1
  for (i in 1:n) { 
      f = f*i
  }
  return(f)
}
# Time Complexity: O(n)
xRaisedToI <- function(x = 0, i = 0) {
    if (i == 0 & x != 0) return(1)
    else if (x ==0 & i == 0) stop("x and i can't be 0 in the same time")

    result <- 1;
    for (j in 1:i) {
      result = x * result
    }
    return(result)
}

# Time Complexity: O(n^2)
series <- function(x = 0, n = 0) { 
  if (n == 0) return(0)

  tryCatch(
    expr = { 
      result <- 0
      for (i in 1:n) { # O(n)
        numerator = factorial(i); # O(n)
        denominator = xRaisedToI(x, i); # O(n)
        # check For the denominator
        if (denominator == 0) stop("You can't devide by 0")

        result = (numerator / denominator) + result
      }
      return(result)
    },
    error = function(e) { 
        print(paste("Error:", e$message))
    }
  )


}

#x <- as.integer(readline(prompt = "Enter x: "))
#n <- as.integer(readline(prompt = "Enter n: "))

#result = series(x, n)
#cat("X:", x, "N:",n, "Result:", result, "\n")







s <- 0
f <- 1
p <- 1
for (i in 1:n) {
  
}





