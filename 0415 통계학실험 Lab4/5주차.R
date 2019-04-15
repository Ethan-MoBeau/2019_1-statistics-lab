alpha<-0.05
n<-50
mu<-0
sigma<-1
count<-0

for (i in 1:1000){
  x<-rnorm(n, mu, sigma)
  upper<-mean(x)-qnorm(alpha/2)*(sigma/sqrt(n))
  lower<-mean(x)+qnorm(alpha/2)*(sigma/sqrt(n))
  if ( (lower < mu) & (mu< upper) ) count=count+1
}
count/1000 

data<-read.csv("C:/Users/BasicSTAT00/Downloads/ames.csv");
area<-data$Gr.Liv.Area
mean(area); var(area) #1

sample_60<-sample(area,60,replace = F)
mean(sample_60) #2

upper<-mean(sample_60)-qnorm(0.025)*sqrt(var(area)/60)
lower<-mean(sample_60)+qnorm(0.025)*sqrt(var(area)/60)
upper; lower

upper<-c()
lower<-c()
for(i in 1:50){
  sample_60<-sample(area,60,replace = F)
  upper<-c(upper,mean(sample_60)-qnorm(0.025)*sqrt(var(area)/60))
  lower<-c(lower,mean(sample_60)+qnorm(0.025)*sqrt(var(area)/60))
}
upper
lower
pop.mean<-mean(data)

plot_ci <- function(lo, hi, m) {
  par(mar=c(2, 1, 1, 1), mgp=c(2.7, 0.7, 0))
  k <- length(lo)
  ci.max <- max(rowSums(matrix(c(-1 * lo, hi), ncol=2)))
  xR <- m + ci.max * c(-1, 1)
  yR <- c(0, 41 * k / 40)
  plot(xR, yR, type='n', xlab='', ylab='', axes=FALSE)
  abline(v=m, lty=2, col='#00000088')
  axis(1, at=m, paste("mu = ", round(m, 4)), cex.axis=1.15)
  for(i in 1:k) {
    x <- mean(c(hi[i], lo[i]))
    ci <- c(lo[i], hi[i])
    if (lo[i]>m | m>hi[i]) {
      col <- "#F05133"
      points(x, i, cex=1.4, col=col)
      lines(ci, rep(i, 2), col=col, lwd=5)
    }
    col <- 1
    points(x, i, pch=20, cex=1.2, col=col)
    lines(ci, rep(i, 2), col=col)
  }
}

plot_ci(lower, upper, pop.mean) # 그래프 실행 코드
