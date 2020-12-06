library(vcd)
library(MASS)

data <- read.csv(file = 'outcome.csv', na.strings=c("", NA))
cat(colnames(data))
cat('\n')
print(head(data))
cat('\n')

print(table(data$relationship))
cat('\n')

par(mar=c(15,6,6,6))
data_table <- table(data$income, data$native.country)
data_table[data_table == 0] <- NA
barplot(data_table, col = c("blue", "red")
        , legend = rownames(data_table), beside = TRUE, args.legend = list(x = "topleft")
        , ylab = "Quantity", log = "y", las = 2)
cat('\n')

outcome <- data
mosaic(outcome$income ~ outcome$education, labeling = labeling_border(rot_labels = c(0, 0, 0, 0)
        , just_labels = c("right")))

plot(ecdf(outcome$age), xlab = "Age", ylab = "Probability", main = "CDF")

