
pollutantmean<-function(directory,pollutant,id){
    pmean<-c()
    for(i in id){
        filename<-paste(directory,"/",formatC(i,width=3,flag="0"),".csv",sep="")
        x<-read.csv(filename)$sulfate
        pmean<-c(pmean,mean(x[!is.na(x)]))
    }
    mean(pmean)
}
