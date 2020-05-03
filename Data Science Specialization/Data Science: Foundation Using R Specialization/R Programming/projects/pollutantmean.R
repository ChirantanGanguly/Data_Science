pollutantmean <- function(directory, pollutant, id= 1:332){
  #Create an empty vector dirty to hold all the values of the pollutant specified including the ones with NA
  dirty = c()
  for(i in id){
    #creating the file name ("001.csv","002.csv","003.csv"..."332.csv")
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    
    #Reading the data in the .csv file and storing in x
    x<-read.csv(filename)
    
    #Storing all the elements of the specified pollutant including all the NA values in dirty
    dirty = c(dirty, x[,pollutant])
  }
  
  #cleaning the data by removing the NA values and storing in clean
  clean<-dirty[!is.na(dirty)]
  
  #Returning the mean
  mean(clean)
}
