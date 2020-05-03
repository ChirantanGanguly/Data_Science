## R Programming Project 1 (Week 2)

For this first programming assignment you will write three functions that are meant to interact with dataset that accompanies this assignment. The dataset is contained in a zip file specdata.zip that you can download from the Coursera web site.

Although this is a programming assignment, assessment will be through a separate quiz.



The zip file containing the data can be downloaded here:
[specdata.zip](https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip) [2.4MB]
</br>Description: The zip file contains 332 comma-separated-value (CSV) files containing pollution monitoring data. 

### Part 1 ([pollutantmean.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/pollutantmean.R))

```R
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
  
  

# Example usage
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)

#Solution
[1] 4.064128

# Example usage
source("pollutantmean.R")
pollutantmean("specdata", "nitrate", 70:72)

#Solution
[1] 1.706047
}
```

### Part 2 ([complete.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/complete.R))
```R
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



#Example usage
source("complete.R")
complete("specdata", c(2, 4, 8, 10, 12))

#Solution
   id nobs
 1  2 1041
 2  4  474
 3  8  192
 4 10  148
 5 12   96
```

### Part 3 ([corr.R](https://github.com/ChirantanGanguly/datasciencecoursera/blob/master/Data%20Science%20Specialization/Data%20Science:%20Foundation%20Using%20R%20Specialization/R%20Programming/projects/corr.R))
```R
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


# Example Usage
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)

#Solution
[1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
```
