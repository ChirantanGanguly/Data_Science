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
