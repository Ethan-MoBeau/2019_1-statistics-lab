#t검정은 평균에 대한 검정

#HW4
#예제1

data1<-read.table("teXtbooks.txt")
t.test(data1$amazNew, data1$uclaNew, var.equal=T)

#H0 : mu1 = mu2 / H1 : m1 : mu1 1= mu2
#p-value = 0.16 : 기각되지 않음.

#예제2
data2<-read.table("run10samp.txt")
var.test(data2$time ~ data2$gender)

#등분산 검정 : p-value = 0.1833 > 0.05 : 기각되지 않음.

t.test(data2$time ~ data2$gender,var.equal=T)

male<-data2$time[data2$gender == 'M']
female<-data2$time[data2$gender == 'F']
t.test(male,female,var.equal=T)

#H0 : mu1 = mu2 / H1 : m1 : mu1 1= mu2
#p-value = 1.544e-06 : 0.05보다 작으므로 기각됨.