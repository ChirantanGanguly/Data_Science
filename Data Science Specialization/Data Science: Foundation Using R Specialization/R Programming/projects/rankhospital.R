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
