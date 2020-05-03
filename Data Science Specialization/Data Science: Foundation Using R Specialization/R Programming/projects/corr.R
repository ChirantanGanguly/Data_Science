corr<-function(directory,threshold){
  co_vect<-c()
  for(i in 1:332){
    filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
    x<-read.csv(filename)
    z<-complete(directory,i)
    if(z$num>threshold){
      k<-x$sulfate[!is.na(x$sulfate)&!is.na(x$nitrate)]
      l<-x$nitrate[!is.na(x$sulfate)&!is.na(x$nitrate)]
      co_vect<-c(co_vect,cor(k,l))
    }
    }
    co_vect
}