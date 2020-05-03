pollutantmean<-function(directory,pollutant,id){
  pmean<-c()
  for(i in id){
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    x<-read.csv(filename)
    y<-x[,pollutant]
    pmean<-c(pmean,mean(y[!is.na(y)]))
  }
  mean(pmean)
}
