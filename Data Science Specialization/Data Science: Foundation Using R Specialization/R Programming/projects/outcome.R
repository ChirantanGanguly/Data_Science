#Reading the data from "outcome-of-care-measures.csv" setting their colClasses as :charecter
outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")

#The first 6 rows of data
head(outcome)

#Converting the class from character to numeric
outcome[,11]<-as.numeric(outcome[,11])

#plotting the histogram
hist(outcome[,11],xlab="Deaths",ylim=c(0,900),
     main="30-day mortality rates for heart attack",col=8)
