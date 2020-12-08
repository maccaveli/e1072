\name{moment}
\alias{moment}
\title{Statistical Moment}
\description{
  Computes the (optionally centered and/or absolute) sample moment of a
  certain order.
}
\usage{
moment(x, order=1, center=FALSE, absolute=FALSE, na.rm=FALSE)
}
\arguments{
 \item{x}{a numeric vector containing the values whose moment is to be
   computed.}
 \item{order}{order of the moment to be computed, the default is to
   compute the first moment, i.e., the mean.}
 \item{center}{a logical value indicating whether centered moments are
   to be computed.}
 \item{absolute}{a logical value indicating whether absolute moments are
   to be computed.}
 \item{na.rm}{a logical value indicating whether \code{NA} values
   should be stripped before the computation proceeds.}
  \item{x}{a numeric vector containing the values whose moment is to be
   computed.}
 \item{order}{order of the moment to be computed, the default is to
   compute the first moment, i.e., the mean.}
 \item{center}{a logical value indicating whether centered moments are
   to be computed.}
 \item{absolute}{a logical value indicating whether absolute moments are
   to be computed.}
 \item{na.rm}{a logical value indicating whether \code{NA} values
   should be stripped before the computation proceeds.}
  \item{x}{a numeric vector containing the values whose moment is to be
   computed.}
 \item{order}{order of the moment to be computed, the default is to
   compute the first moment, i.e., the mean.}
 \item{center}{a logical value indicating whether centered moments are
   to be computed.}
 \item{absolute}{a logical value indicating whether absolute moments are
   to be computed.}
 \item{na.rm}{a logical value indicating whether \code{NA} values
   should be stripped before the computation proceeds.}
}
\details{
  When \code{center} and \code{absolute} are both \code{FALSE}, the
  moment is simply \code{sum(x ^ order) / length(x) Exactly one of the parameters 'u','v','f2','power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.}.
}
\author{Kurt Hornik and Friedrich Leisch}
\seealso{
  \code{\link{mean}},
  \code{\link{var}}}
\examples{
x <- rnorm(100)

## Compute the mean
moment(x)
## Compute the 2nd centered moment (!= var)
moment(x, order=2, center=TRUE)

## Compute the 3rd absolute centered moment
moment(x, order=3, center=TRUE, absolute=TRUE)

# NOT RUN {
## Exercise 9.1 P. 424 from Cohen (1988)
pwr.f2.test(u=5,v=89,f2=0.1/(1-0.1),sig.level=0.05)
# }

# NOT RUN {
## One sample (power)
## Exercise 2.5 p. 47 from Cohen (1988)
pwr.t.test(d=0.2,n=60,sig.level=0.10,type="one.sample",alternative="two.sided")

## Paired samples (power)
## Exercise p. 50 from Cohen (1988)
d<-8/(16*sqrt(2*(1-0.6)))
pwr.t.test(d=d,n=40,sig.level=0.05,type="paired",alternative="two.sided")

## Two independent samples (power)
## Exercise 2.1 p. 40 from Cohen (1988)
d<-2/2.8
pwr.t.test(d=d,n=30,sig.level=0.05,type="two.sample",alternative="two.sided")

## Two independent samples (sample size)
## Exercise 2.10 p. 59
pwr.t.test(d=0.3,power=0.75,sig.level=0.05,type="two.sample",alternative="greater")

# }


##read
data = read.delim("data.csv",header = T,dec=".", sep = ";")

#Check NA
apply(data,2,function(x){sum(is.na(x))})

#Plot
plot(data,main = "Data", xlab = "data",ylab = "value")

plot(density(data),main = "Data",xlab = "value",ylab = "density",lwd = 2)
lines(seq(min(data),max(data),0.01),dnorm(seq(min(data),max(data),0.01),mean = mean(data),sd=sd(data)),col="blue",lwd = 2,lty = 'dotted')

boxplot(data,main = "Data",ylab = "values",notch = T)

ggqqplot(data,main = "Data")
gridExtra::grid.arrange(qq1,qq2,nrow=2)

#DOE
pairs(data)
scatterplotMatrix(data)
interaction.plot(data$factor1, data$factor2, data$measured))
#DOE Char val.
data %>% group_by(factor1,factor2) %>% summarize(mean_factors = mean(measured),sd_factors = sd(measured))

#lm
model1 = lm(m~.^2 ,data=data3)
mod = lm(measured~.^3+I(factor1^2)+I(factor2^2)+I(factor3^2)+I(factor3^2)+I(factor2*factor1^2)+I(factor3*factor1^2)+I(factor1*factor2^2)+I(factor3*factor2^2)+I(factor1*factor3^2)+I(factor2*factor3^2) ,data=data)
summary(mod)
anova(mod,mod_old)

#Parabula
mod=lm(measured~ poly(factor1, degree = 2,raw=T),data=data)
summary(mod)

#Opt Model
stepm <- stepAIC(model1, direction="both")
stepm$anova

#Resid. Homogenous
par(mfrow = c(1,2))
plot(mod,which=1)
plot(mod,which=3)
ncvTest(mod)
mod_r2=summary(mod)$r.squared

#Power of lm
f=mod_r2/(1-mod_r2)
uf=1
sig=0.01
p=0.99
f2_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n=f2_res$v+uf+1

#Cooks leverage
par(mfrow = c(1,2))
plot(mod,which=4)
plot(mod,which=6)
cd1c=4/length(mod$residuals)
cd1=abs(cooks.distance(mod))
subset(cd1, cd1 > cd1c)

MEPlot(mod)
IAPlot(mod)

#Normality
shapiro.test(data)

#Outlier
rosnerTest(data, k = 2, alpha = 0.05, warn = T)

#Box Cox
data=data-min(data)+1
x=powerTransform(data, family="bcPower")
transData=bcPower(data,lambda=x$lambda)

#Characteristic Val.
values1=c(mean(s1),median(s1),sd(s1),mad(s1),min(s1),quantile(s1,0.25),quantile(s1,0.75),max(s1),skewness(s1),mc(s1),kurtosis(s1))
values2=c(mean(s2),median(s2),sd(s2),mad(s2),min(s2),quantile(s2,0.25),quantile(s2,0.75),max(s2),skewness(s2),mc(s2),kurtosis(s2))
values3=c(mean(s3),median(s3),sd(s3),mad(s3),min(s3),quantile(s3,0.25),quantile(s3,0.75),max(s3),skewness(s3),mc(s3),kurtosis(s3))
values4=c(mean(s4),median(s4),sd(s4),mad(s4),min(s4),quantile(s4,0.25),quantile(s4,0.75),max(s4),skewness(s4),mc(s4),kurtosis(s4))
column.names <- c("mean","median","$\\sigma$","MAD","Min","Q1","Q3","Max","skewness","Medcouple","kurtosis")
row.names <- c("s1","s2","s3","s4")
results = array(rbind(values1,values2,values3,values4),dim = c(4,11),dimnames = list(row.names,column.names))
kable(results)

#FWHM
d <- density(data)
xmax <- d$x[d$y==max(d$y)]
x1 <- d$x[d$x < xmax][which.min(abs(d$y[d$x < xmax]-max(d$y)/2))]
x2 <- d$x[d$x > xmax][which.min(abs(d$y[d$x > xmax]-max(d$y)/2))]
fwhm=x2-x1



#Plan
set.seed(1234) # set the seed for the random numbers
f <- factor(seq(1,5,4/(n-1))) # generate vector of factor levels
fac <- sample(f,7) # radomize the order of levels
plan <- data.frame(level =fac) # create a data frames with all experiments

#Plan with continuous factor
nparam <- 3
levels <- seq(1000,1500,(1500-1000)/(nparam-1))
lvlsamp <- sample(levels,nparam)#Randomize
plan <- data.frame(parameter=lvlsamp)
#Write matr number
write.table(1, file="plan1.csv", sep=";", dec=".", row.names=F, col.names=F,append=F)
#write Testplan
write.table(plan, file="plan1.csv", sep=";", dec=".", row.names=F, col.names=T,append=T)
#find optimum with parabula
mod1=lm(measured~poly(parameter, degree=2, raw=T),data=data71)
x_max=as.double(-mod1$coefficients[2]/(2*mod1$coefficients[3]))

#Plan DOE
Var1=c(-1,1) # generate vector of factor1
Var2=c(-1,1)  # generate vector of factor2
Var3=c(-1,1) # generate vector of factor3
plan=expand.grid(Var1,Var2,Var3)
n_rep=4 # number of replicates
planr=do.call("rbind", replicate(n_rep, plan, simplify=F))
set.seed(1234) # set the seed for the random numbers
plan_r=planr[order(sample(1:nrow(planr))),] #randomised design
#Alternative Approach full factorial
plan2 = fac.design(factor.names=list(Var1=c(-1,1), Var2=c(-1,1), Var3=c(-1,1)),replications=10,seed=1)





#blocked design instead of full factorial
plan3=fac.design(factor.names=list(temp=c(160,170), pres=c(700,800)),replications =3 , blocks=2, randomize = T, block.name = "Tech")
plan3=subset(plan3, select = -c(Blocks) ) # drop the not needed Blocks column
ma<- rep( 1 , times=length(plan3[,1])) # generate a vector with machine number
plan3a=cbind(ma,plan3)
matrnb=1
# First line writes the Matrikelnummer
write.table(matrnb,file="plan.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan1,file="plan.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
data=read.delim("plan.csv",header = T,dec=".", sep = ";")
data=transform(data,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
f=r2/(1-r2)
uf=2
f2_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=0.01,power=0.99)
n=ceiling(f2_res$v+uf+1)

ma=c(1,2)
ts=c(4000,6000)
fr=c(0.001,0.003)
plan2=expand.grid(ma,ts,fr)
# plan2=rbind(plan2,plan2,plan2,plan2,plan2,plan2) # 6 replicates
plan2=do.call("rbind", replicate(n2, plan2, simplify=F)) # better programming than the line before
names(plan2)<- c("ma","ts","fr") # to names the variables
set.seed(1234) # set seed for random number generator
plan2=plan2[order(sample(1:nrow(plan2))),] # randomize design
# Alternative
plan2a=fac.design(factor.names=list(ma=c(1,2),ts=c(4000,6000), fr=c(0.001,0.003)),replications =n2 , randomize = T)
plan2a=subset(plan2a, select = -c(Blocks) ) # drop the not needed Blocks column
matrno=1
# First line writes the Matrikelnummer
write.table(matrno,file="plan2_73.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan2,file="plan2_73.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
data73b=read.delim("plan2_73_res.csv",header = T,dec=".", sep = ";")
data73b=transform(data73b,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(data73b)




#Block Design
#Incomplete Blocked Design
bs = 2 # Block size
gw = 4 # number of pfactors
bd=bibd(v=gw,k=bs)
#Transform to Plan
plan1=as.data.frame.model.matrix(bd)
plan2=cbind(c(1:(length(bd)/2)),plan1)
colnames(plan2)<-c("machine","run")
data=transform(data,machine=as.factor(machine))


#Testing
#mean
t.test(x=mach2,y=mach1, mu=.2*m1, alternative = "less",paired=F, conf.level = 0.95) #H0:(m2-m1)>=m1*0.2
t.test(data, mu = 0.6 , conf.level = 0.95)
#SD with F-Test
var.test(data1,data2, conf.level = 0.95)
#mean 3 samples Anova Welch for uneq. var
dat=stack(data) # stack the data
names(dat)=c("row","col") # row=values;col=set1,set2,set3
oneway.test(row~col,var.equal="F")
#SD 3 samples
bartlett.test(data)
#Wilcoxon non norm. distr test median 2 sample
wilcox.test(weight ~ group, data = data, exact = FALSE, alternative = "two.sided")
#Kruskal non norm. distr test median 3 sample
kruskal.test(value ~ set, data = data)

#Power
d=(1.87-1.7)/(1.7*0.05)
pwr.t.test(n=NULL,d=d, sig.level = 0.01, power = 0.99, type = "one.sample", alternative = "greater")
OR pwr.anova.test(k=2, n = NULL,f=d, sig.level=.01, power = .90)
#calc n of experiments with relative error/mean square
rel_error=0.01
n=(SD(data)/(rel_error*mean(Data)))^2
#calc rel error
rel_error=SD(data)/mean(data)/sqrt(nrow(data))

#delta m
np=size.t.test(type = 'one.sample', power = .95,delta=mean_old*0.2, sd=sd_old , sig.level=.05,alternative = "one.sided")
#diff in variance with factor/ratio 2 betw variances
n=size.comparing.variances(ratio=(0.1/0.05)^2,alpha=0.05,power=0.95)

}
\keyword{univar}