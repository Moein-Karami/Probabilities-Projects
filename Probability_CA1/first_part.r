grades <- read.csv(file = 'exam_data.csv')

summar <-summary(grades)
vars <- c(var(grades$Exam1), var(grades$Exam2))
names(vars) <- c("Exam1", "Exam2")
summar <- rbind(summar, vars)

print(summar)

Different <- abs(grades$Exam1 - grades$Exam2)
grades <- cbind(grades, Different)

boxplot(grades)
abline(h=quantile(grades$Exam1, c(0.25, 0.5, 0.75)), col="red")
abline(h=quantile(grades$Exam2, c(0.25, 0.5, 0.75)), col="blue")
abline(h=quantile(grades$Different, c(0.25, 0.5, 0.75)), col="green")

charak <- cbind(quantile(grades$Exam1, c(0.25, 0.5, 0.75)),
        quantile(grades$Exam2, c(0.25, 0.5, 0.75)),
        quantile(grades$Different, c(0.25, 0.5, 0.75)))

colnames(charak) <- c("Exam1", "Exam2", "Different")
charak <- t(charak)
cat('\n')
print(charak)