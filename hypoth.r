BDD <- read.csv2(file.choose(), sep = ";") 
print(BDD$test.avant)

attach(BDD)

names(BDD)

aggregate(test.avant~genre, data=BDD, mean)


auto.t.test <- function(y, x, BDD) {
  
  N <- aggregate(y ~ x, data=BDD, length)

  if (N[1,2] >= 30 && N[2,2] >=30) {
    Normal <- TRUE
  } else {
    if((N[1,2]+N[2,2]) >= 25) {
      Normal <- (ks.test(y, "pnorm")$p.value>=0.05)
      
    } else {
      Normal <- (shapiro.test(y)$p.value >= 0.05)
    }
  }
  
  if (Normal == TRUE) {
    var_test_result <- var.test(y ~ x) 
    Homog <- (var_test_result$p.value >= 0.05)
    result <- t.test(y~x, var.equal=Homog)

  } else {
    result <- wilcox.test(y~x)
  }
  return(resutl)
}


auto.t.test(test.avant, genre, BDD)



















  
  
  
  
  










  
