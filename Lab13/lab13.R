#8장

#예제1

#1
data <- read.table("handspan.txt",header=T)
cor(data$Height,data$HandSpan)
plot(data$Height,data$HandSpan)

#어느 정도 있어보이나 뚜렷하게 나타나지는 않는ㄷ

cor.test(data$Height,data$HandSpan)

#p-value < 0.05 이므로 상관관계가 존재한다고 할 수 있다.

#2
lm(data$Height ~ data$HandSpan)

#y = 35.53 + 1.56x

#3
data.res <- lm(data$Height ~ data$HandSpan)
summary(data.res)

#p-value<2e-16<0.05 이므로 회귀직선이 유의하다고 할 수 있다.

#4
plot(data.res)

#잔차도가 특정한 패턴을 보이거나 등분산성 가정을 위배한 것으로 보이지 않고, 잔차의 정규 분위수 그래프에서 잔차가 직선 근처에 몰려있는 것으로 보아 단순선형회귀모형의 적용은 타당하다.

#예제2

#1
data2 <- read.table("carstopping.txt",header = T)
cor.test(data2$StopDist,data2$Speed)

#상관계수 0.9355로 매우 크고 p-value역시 매우 작아 상관관계가 존재한다고 할 수 있다.

#2
data2.res<-lm(data2$StopDist ~ data2$Speed)
summary(data2.res)

#R^2 = 0.8752
#p-value가 매우 작으므로 (<0.05) 모형이 유의하다고 할 수 있다.

#3
plot(data2.res)

#잔차도를 확인해보면 약간의 곡률이 나타난다. 또한 정규분위 그래프에서도 직선을 벗어나는 잔차가 꽤 많이 존재한다.따라서 타당하다고 볼 수 없다.
#4
plot(data2$StopDist,data2$Speed)
sqrt.dist<-sqrt(data2$StopDist)

plot(sqrt.dist,data2$Speed)

#선형관계를 가지고 있다.

#5
data2new.res<-lm(sqrt.dist ~ data2$Speed)
summary(data2new.res)

#R^2=0.9244 > 0.8752 : 더 켜졌다.

#6
plot(data2new.res)

#잔차도에 곡률과 같은 패턴이 없고, 잔차가 직선 근처에 모두 위치한다. 따라서 타당하다고 볼 수 있다.

#예제3

#1 
data3 <- read.table("hospital.txt",header=T)

plot(data3)
cor(data3)

#InfctRsk-Stay : 0.533443831 / InfctRsk-Age : 0.001093166 / IntctRsk-Xray : 0.453391557
#Stay와 Xray 상관관계 약간 존재, Age 존재 x

#2
data3.res<-lm(InfctRsk ~ Stay + Age + Xray, data=data3)
summary(data3.res)

#Stay와 Xray에 대해서는 p-value < 0.05, Age에 대해서는 0.33으로 매우크다.
#따라서 Age를 제외한 나머지 둘에 대해서만 유의하다.

#3
plot(data3.res)

#정규분위 그래프를 보면 잔차가 직선근처에 위치하므로 타당하다고 볼 수 있다.