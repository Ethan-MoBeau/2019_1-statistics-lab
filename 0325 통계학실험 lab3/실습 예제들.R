x<-c(1,3,4,5,6)
x
x[-2]
x

seq(from=1,to=10,by=1)
seq(from=1,to=15,length=10)
seq(from=1,by=2,length=10)

3:10
10:3
rep(3,5)
rep(c(1,2,3),2)

a1<-c(1,2,3,4)
a2<-c(1,2,3,4)
a3<-c(1,2,3,4)
mat<-rbind(a1,a2,a3)
mat
mat[2]
mat[1,3]
mat[1:2,2]
mat[,2]
matrix(c(1:6),2,3)

#r markdown에서 r setup 블록 놔둬야됨

#r block 만드려면 ctrl+alt+i
#or ```{} ``` 도 가능

#보고서 보려면 ctrl+shift+k