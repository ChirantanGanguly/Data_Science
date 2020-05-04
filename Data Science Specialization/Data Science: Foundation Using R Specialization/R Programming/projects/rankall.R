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
  return(answer)
}