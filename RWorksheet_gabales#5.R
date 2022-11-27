install.packages("ggplot2")
require(ggplot2)

#1
#a.	Plot the data using a bar graph. 

Enrollment <-c(80,75,70,60)
barplot(Enrollment,
        main="BS in Computer Science",
        xlab="Course year",
        ylab="2019-2020",
        names.arg = c("1st", "2nd", "3rd", "4th"))

#b.	Using the same table, label the barchart with

Enrollment <-c(80,75,70,60)
barplot(Enrollment,
        main="Enrollment of BS Computer Science",
        xlab="Curriculum Year",
        ylab="number of students",
        names.arg = c("1st", "2nd", "3rd", "4th"),)

#2
#a. Create a table
library(scales)
spent <- c(0.6,0.1,0.05,0.25)

data <- matrix(percent(spent), ncol = 1)
rownames(data) <- c("Food", "Electricity","Savings", "other expenses")
colnames(data) <- c("Spent")

final=as.table(data)
final

#b.	Plot the data using a pie chart. Add labels, colors and legend.
#Write the codes and its result.

spent <- c(60, 10, 5, 25)

spent_labels <- round(spent/sum(spent) * 100, 1)
spent_labels <- paste(spent_labels, "%", sep = "")

pie(spent,
    main = "Miscellaneous",
    col = rainbow(length(spent)),
    labels = spent_labels,
    cex = 0.8)
legend(1.5, 0.5, c("Food","Electricity","Savings","Other expenses"),
       cex = 0.8, fill = rainbow((length(spent))))


#3.	Open the mtcars dataset.

data("mtcars")
head(mtcars)

#a.	Create a simple histogram specifically for mpg (miles per gallon) variable. 

hist(mtcars$mpg)

#b. Colored histogram with different number of bins. hist(mtcars$mpg, breaks=12, col="red")
#Note: breaks= controls the number of bins

hist(mtcars$mpg, breaks=12, col="red")


#c.	Add a Normal Curve

x <- mtcars$mpg
h<-hist(x, breaks=10, col="red", xlab="Miles Per Gallon",
        main="Histogram with Normal Curve")
xfit<-seq(min(x),max(x),length=40)
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)


#4.	Open the iris dataset. Create a subset for each species.
#a.	Write the codes and its result.

data("iris")
force(iris)
set_iris <- subset(iris, Species == "setosa")
set_iris

ver_iris <- subset(iris, Species == "versicolor")
ver_iris

vir_iris <- subset(iris, Species == "virginica")
vir_iris

#b.	Get the mean for every characteristics of each species using colMeans(). 
#Write the codes and its result.

setosa <- colMeans(set_iris[sapply(set_iris,is.numeric)])
setosa

versicolor <- colMeans(ver_iris[sapply(ver_iris,is.numeric)])
versicolor

virginica <- colMeans(vir_iris[sapply(vir_iris,is.numeric)])
virginica

#c. Combine all species by using rbind()
#The table should be look like this:

species <- rbind(setosa, versicolor, virginica)
species


#d. From the data in 4-c: Create the barplot().
#Write the codes and its result.
#The barplot should be like this.
barplot(species, beside = TRUE,
        main = "Iris Data",
        xlab = "Characteristics",
        ylab = "Mean Scores",
        col = c("red","green","blue"))


