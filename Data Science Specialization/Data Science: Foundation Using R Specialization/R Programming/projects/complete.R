complete<-function(directory,id=1:332){
  #Creating an empty vector nobs to store the number of completely observed cases in each data file.
  nobs<-c()
  
  for(i in id){
    #creating the file name ("001.csv","002.csv","003.csv"..."332.csv")
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    
    #Reading the data in the .csv file and storing in x
    x<-read.csv(filename)
    
    #The number of completely observed cases is basically is the least length of all the different component vectors of
    #the dataset x
    k<-min(length(x$Date[!is.na(x$Date)]),length(x$sulfate[!is.na(x$sulfate)]),length(x$nitrate[!is.na(x$nitrate)]),
           length(x$ID[!is.na(x$ID)]))
    
    #Concatenating the value of the present file to the vector nobs
    nobs<-c(nobs,k)
  }
  
  #converting it into a data frame as we are required to give output as a data frame
  data.frame(id,nobs)
}
