BDD <- read.csv2(file.choose(), sep = ";") 
print(BDD$test.avant)

attach(BDD)

names(BDD)
n <- length(test.avant)

Dif <- test.avant - test.apres


if (n >= 30) {
  cat("Sample size is large (n >= 30), using t-test\n")
  test_result <- t.test(test.avant, test.apres, paired = TRUE)
} else {
  shapiro_result <- shapiro.test(Dif)
  
  if (shapiro_result$p.value > 0.05) {
    cat("Data follows a normal distribution, using t-test\n")
    test_result <- t.test(test.avant, test.apres, paired = TRUE)
  } else {
    cat("Data is not normally distributed, using Wilcoxon test\n")
    test_result <- wilcox.test(test.avant, test.apres, paired = TRUE)
  }
}
print(test_result$p.value)

if (test_result$p.value < 0.05) {
  cat("p-value < 0.05: Significant difference detected (Reject H0)\n")
} else {
  cat("p-value >= 0.05: No significant difference detected (Fail to reject H0)\n")
}
