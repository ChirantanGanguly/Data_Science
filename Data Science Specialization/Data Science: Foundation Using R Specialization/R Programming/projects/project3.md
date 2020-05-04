## R Programming Project 3 (Week 4)

The zip file containing the data can be downloaded here:
[Assignment 3 Data](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2FProgAssignment3-data.zip)

###  Part 1 Plot the 30-day mortality rates for heart attack ([outcome.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/outcome.R))

```R
#Reading the data from "outcome-of-care-measures.csv" setting their colClasses as :charecter
outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")

#The first 6 rows of data
head(outcome)

#Converting the class from character to numeric
outcome[,11]<-as.numeric(outcome[,11])

#plotting the histogram
hist(outcome[,11],xlab="Deaths",ylim=c(0,900),
     main="30-day mortality rates for heart attack",col=8)
```
![](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/Rplot.png)
###  Part 2 Finding the best hospital in a state ([best.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/best.R))
```R
best <- function(state, outcome) {
  ## Read outcome data
  data<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  ## Check that state and outcome are valid
  if(!state%in%data$State)
    stop("invalid state")
  if(!(outcome=="heart attack"|outcome=="heart failure"|outcome=="pneumonia"))
    stop("invalid outcome")
  
  ## Return hospital name in that state with lowest 30-day death rate of Heart Attack
  if(outcome=="heart attack"){
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    st<-data$State
    hosp<-data$Hospital.Name
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    out<-hosp[which(ill==min(ill))]
    out<-sort(out)
    return(out)
  }
  
  ## Return hospital name in that state with lowest 30-day death rate of Heart Failure
  if(outcome=="heart failure"){
    st<-data$State
    hosp<-data$Hospital.Name
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    out<-hosp[which(ill==min(ill))]
    out<-sort(out)
    return(out)
  }
  
  ## Return hospital name in that state with lowest 30-day death rate of Pneumonia
  if(outcome=="pneumonia"){
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    st<-data$State
    hosp<-data$Hospital.Name
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    out<-hosp[which(ill==min(ill))]
    out<-sort(out)
    return(out)
  }
}


#Example Usage
> best("TX", "heart attack")
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"
> best("TX", "heart failure")
[1] "FORT DUNCAN MEDICAL CENTER"
> best("MD", "heart attack")
[1] "JOHNS HOPKINS HOSPITAL, THE"
> best("MD", "pneumonia")
[1] "GREATER BALTIMORE MEDICAL CENTER"
> best("BB", "heart attack")
Error in best("BB", "heart attack") : invalid state
> best("NY", "hert attack")
Error in best("NY", "hert attack") : invalid outcome

```

###  Part 3 Ranking hospitals by outcome in a state ([rankhospital.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/rankhospital.R))
```R
rankhospital <- function(state, outcome, num=1) {
  ## Read outcome data
  data<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  ## Check that state and outcome are valid
  if(!state%in%data$State)
    stop("invalid state")
  if(!(outcome=="heart attack"|outcome=="heart failure"|outcome=="pneumonia"))
    stop("invalid outcome")
  
  ## Return hospital name in that state with nth 30-day death rate of Heart Attack
  if(outcome=="heart attack"){
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    st<-data$State
    hosp<-data$Hospital.Name
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    
    #Checking if num is valid
    if(is.character(num)){
      if(num=="best")
        num<-1
      else if(num=="worst")
        num<-length(ill)
      else
        stop("invalid rank")
    }
    if(num>length(ill))
      return(NA)
    z<-sort(ill,partial=num)[num]
    out<-hosp[which(ill==z)]
    out<-sort(out)
    return(out[num-length(which(ill<z))])
  }
  
  ## Return hospital name in that state with nth 30-day death rate of Heart Failure
  if(outcome=="heart failure"){
    st<-data$State
    hosp<-data$Hospital.Name
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    
    #Checking if num is valid
    if(is.character(num)){
      if(num=="best")
        num<-1
      else if(num=="worst")
        num<-length(ill)
      else
        stop("invalid rank")
    }
    if(num>length(ill))
      return(NA)
    z<-sort(ill,partial=num)[num]
    out<-hosp[which(ill==z)]
    out<-sort(out)
    return(out[num-length(which(ill<z))])
  }
  
  ## Return hospital name in that state with nth 30-day death rate of Pneumonia
  if(outcome=="pneumonia"){
    suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    st<-data$State
    hosp<-data$Hospital.Name
    st<-st[!is.na(ill)]
    hosp<-hosp[!is.na(ill)]
    ill<-ill[!is.na(ill)]
    ill<-ill[st==state]
    hosp<-hosp[st==state]
    st<-st[st==state]
    
    #Checking if num is valid
    if(is.character(num)){
      if(num=="best")
        num<-1
      else if(num=="worst")
        num<-length(ill)
      else
        stop("invalid rank")
    }
    if(num>length(ill))
      return(NA)
    z<-sort(ill,partial=num)[num]
    out<-hosp[which(ill==z)]
    out<-sort(out)
    return(out[num-length(which(ill<z))])
  }
}


#Example Usage
> rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
> rankhospital("MD", "heart attack", "worst")
[1] "HARFORD MEMORIAL HOSPITAL"
> rankhospital("MN", "heart attack", 5000)
[1] NA

```

###  Part 4 Ranking hospitals in all states ([rankall.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/rankall.R))
```R
rankall <- function(outcome, num=1) {
  ## Read outcome data
  data<-read.csv("outcome-of-care-measures.csv",colClasses = "character")
  ## Check that outcome is valid
  if(!(outcome=="heart attack"|outcome=="heart failure"|outcome=="pneumonia"))
    stop("invalid outcome")
  x<-data$State
  x<-sort(x)
  x<-unique(x)
  oa<-NULL
  for(i in 1:length(x)){
    state<-x[i]
    if(outcome=="heart attack"){
      suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
      st<-data$State
      hosp<-data$Hospital.Name
      st<-st[!is.na(ill)]
      hosp<-hosp[!is.na(ill)]
      ill<-ill[!is.na(ill)]
      ill<-ill[st==state]
      hosp<-hosp[st==state]
      st<-st[st==state]
      
      #Checking if num is valid
      if(is.character(num)){
        if(num=="best")
          num<-1
        else if(num=="worst"){
          z<-sort(ill,partial=length(ill))[length(ill)]
          out<-hosp[which(ill==z)]
          out<-sort(out)
          oa[i]<-out[length(ill)-length(which(ill<z))]
          next
        }
        else
          stop("invalid rank")
      }
      if(num>length(ill)){
        oa[i]<-NA
        next
      }
      z<-sort(ill,partial=num)[num]
      out<-hosp[which(ill==z)]
      out<-sort(out)
      oa[i]<-out[num-length(which(ill<z))]
    }
    if(outcome=="heart failure"){
      suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
      st<-data$State
      hosp<-data$Hospital.Name
      st<-st[!is.na(ill)]
      hosp<-hosp[!is.na(ill)]
      ill<-ill[!is.na(ill)]
      ill<-ill[st==state]
      hosp<-hosp[st==state]
      st<-st[st==state]
      
      #Checking if num is valid
      if(is.character(num)){
        if(num=="best")
          num<-1
        else if(num=="worst"){
          z<-sort(ill,partial=length(ill))[length(ill)]
          out<-hosp[which(ill==z)]
          out<-sort(out)
          oa[i]<-out[length(ill)-length(which(ill<z))]
          next
        }
        else
          stop("invalid rank")
      }
      if(num>length(ill)){
        oa[i]<-NA
        next
      }
      z<-sort(ill,partial=num)[num]
      out<-hosp[which(ill==z)]
      out<-sort(out)
      oa[i]<-out[num-length(which(ill<z))]
    } 
    if(outcome=="pneumonia"){
      suppressWarnings(ill<-as.numeric(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
      st<-data$State
      hosp<-data$Hospital.Name
      st<-st[!is.na(ill)]
      hosp<-hosp[!is.na(ill)]
      ill<-ill[!is.na(ill)]
      ill<-ill[st==state]
      hosp<-hosp[st==state]
      st<-st[st==state]
      
      #Checking if num is valid
      if(is.character(num)){
        if(num=="best")
          num<-1
        else if(num=="worst"){
          z<-sort(ill,partial=length(ill))[length(ill)]
          out<-hosp[which(ill==z)]
          out<-sort(out)
          oa[i]<-out[length(ill)-length(which(ill<z))]
          next
        }
        else
          stop("invalid rank")
      }
      if(num>length(ill)){
        oa[i]<-NA
        next
      }
      z<-sort(ill,partial=num)[num]
      out<-hosp[which(ill==z)]
      out<-sort(out)
      oa[i]<-out[num-length(which(ill<z))]
    }
    
    
  }
  answer<-data.frame(oa,x)
  colnames(answer)<-c("hospital","state")
  return(answer)
}
```
