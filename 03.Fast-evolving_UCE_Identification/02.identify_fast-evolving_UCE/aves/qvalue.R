data<- read.table("all.ACC.sc",header=FALSE)
y<-p.adjust(data$V9)
z<-cbind(data,y)
write.table(file="all.ACC.sc.qvalue.results",z,sep="\t",quote=F,row.names=F,col.names=F)
