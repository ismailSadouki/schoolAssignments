
BDD <- read.csv2(file.choose())
attach(BDD)

BDD$Diff <- BDD$test.apres - BDD$test.avant


table_size <- table(BDD$specialite)
sufficient_size <- all(table_size >= 30)

ks <- ks.test(BDD$Diff, "pnorm")
shapiro <- shapiro.test(BDD$Diff)

# Homog
variance_test <- bartlett.test(Diff ~ specialite, data = BDD)


if (sufficient_size) { # n>=30
  if (variance_test$p.value > 0.05) { # Homog
    # ANOVA
    model <- aov(Diff ~ specialite, data = BDD)
    summary(model)
    
    if (summary(model)[[1]][["Pr(>F)"]][1] < 0.05) {
      posthoc <- TukeyHSD(model)
      print(posthoc)
    }
  } else {
    # Welch
    model <- oneway.test(Diff ~ specialite, data = BDD, var.equal = FALSE)
    print(model)
  }
} else {
  if (ks$p.value > 0.05 & shapiro$p.value > 0.05) { # Normality
    if (variance_test$p.value > 0.05) { # Homog
      # ANOVA
      model <- aov(Diff ~ specialite, data = BDD)
      summary(model)
      
      if (summary(model)[[1]][["Pr(>F)"]][1] < 0.05) {
        posthoc <- TukeyHSD(model)
        print(posthoc)
      }
    } else {
      # Welch
      model <- oneway.test(Diff ~ specialite, data = BDD, var.equal = FALSE)
      print(model)
    }
  } else {
    kruskal <- kruskal.test(Diff ~ specialite, data = BDD)
    print(kruskal)
    
    if (kruskal$p.value < 0.05) {
      pairwise <- pairwise.wilcox.test(BDD$Diff, BDD$specialite, p.adjust.method = "bonferroni")
      print(pairwise)
    }
  }
  
  
}

boxplot(Diff ~ specialite,
        data = BDD,
        col = "skyblue",
        main = "Score Improvement by Specialité",
        ylab = "Test Improvement (Diff)",
        xlab = "Specialité")
means <- tapply(BDD$Diff, BDD$specialite, mean)
points(1:length(means), means, col = "red", pch = 19)

