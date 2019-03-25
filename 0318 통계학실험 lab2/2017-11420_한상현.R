cdc<-read.table("C:/Users/BasicSTAT00/Downloads/cdc.txt",header=T)
table(cdc$genhlth)
# 1. 범주형 자료 정리

summary(cdc$weight)
mean(cdc$weight)
# 2. weight의 수치적 요약 / 평균

plot(cdc$weight,cdc$wtdesire)
cor(cdc$weight,cdc$wtdesire)
# 3. weight과 wtdesire의 관계 / 상관계수
# 실질적으로 0.8의 상관계수로 상관관계가 어느 정도 있다고 할 수 있다.

wdiff<-cdc$wtdesire-cdc$weight
summary(wdiff)
hist(wdiff,breaks=100)
stem(wdiff)
# 4. wdiff 변수 만들고 수치적 요약, 그래프 요약

hist(cdc$age)
hist(cdc$age,breaks=50)
hist(cdc$age,breaks=100)
# 5. age 변수의 히스토그램