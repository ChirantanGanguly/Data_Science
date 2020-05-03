complete<-function(directory,id){
  num<-c()
  for(i in id){
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    x<-read.csv(filename)
    num<-c(num,min(length(x$Date[!is.na(x$Date)]),length(x$sulfate[!is.na(x$sulfate)]),length(x$nitrate[!is.na(x$nitrate)]),length(x$ID[!is.na(x$ID)])))
  }
  data.frame(id,num)
}
