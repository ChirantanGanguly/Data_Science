corr<-function(directory,threshold=0){
  #Creating an empty vector co_vect to store the correlation of "sufate" and "nitrate" pollution in each file
  co_vect<-c()
  
  for(i in 1:332){
    #creating the file name ("001.csv","002.csv","003.csv"..."332.csv")
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    
    #Reading the data in the .csv file and storing in x
    x<-read.csv(filename)
    
    #Stoting the value returned from the function complete in z
    z<-complete(directory,i)
    
    #Checking if the number of completely observed cases is greater than the threshold
    if(z$nobs>threshold){
      
      #Storing the sulfate value of the data whose both "sulfate" and "nitrate" values are available
      k<-x$sulfate[!is.na(x$sulfate)&!is.na(x$nitrate)]
      
      #Storing the nitrate value of the data whose both "sulfate" and "nitrate" values are available
      l<-x$nitrate[!is.na(x$sulfate)&!is.na(x$nitrate)]
      
      #Calculating and storing the "sulfate" and "nitrate" correlation in co_vect
      co_vect<-c(co_vect,cor(k,l))
    }
  }
  
  #Returning the vector co_vect
  co_vect
}
