\name{moment2}
\alias{moment2}
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
 \item{n}{a numeric vector containing the values whose moment is to be
   computed.}
 \item{d}{Effect size (Cohen's d) - difference between the means divided by the pooled standard deviation}
 \item{sig.level}{a logical value indicating whether centered moments are
   to be computed.}
 \item{power}{Power of test (1 minus Type II error probability)}
 \item{type}{Type of t test : one- two- or paired-samples}
 \item{alternative}{a character string specifying the alternative hypothesis, must be one of "two.sided" (default), "greater" or "less"}
}
\details{
  When \code{center} and \code{absolute} are both \code{FALSE}, the
  moment is simply \code{sum(x ^ order) length(x) Exactly one of the parameters 'u','v','f2','power' and 'sig.level' must be passed as NULL, and that parameter is determined from the others. Notice that the last one has non-NULL default so NULL must be explicitly passed if you want to compute it.}.
}
\author{Kurt Hornik and Friedrich Leisch}
\seealso{
  \code{\link{mean}},
  \code{\link{var}}},
  \code{\link{ftest}}}
\examples{
x <- rnorm(100)

## Compute the mean
moment(x)
## Compute the 2nd centered moment (!= var)
moment(x, order=2, center=TRUE)

## Compute the 3rd absolute centered moment
moment(x, order=3, center=TRUE, absolute=TRUE)

# NOT RUN {
###########1?
## Generate Data

Task:\

- You have seven machines for which you want to find out what they do. Write a test plan into a file
(suggested replicates: 300).\
- The file starts with the Matrikelnumber. This row is followed by a row with names with 1 column. 
Names: ma. In the following rows follows the plan with the machines to be tested. There is always 1 
column.\
- Set up a test plan to investigate the machines and write the plan to a csv file.

{r}
ma=seq(1,7)                                               # number of machines tested
nr=300                                                    # number of replicates
plan1=expand.grid(ma)                                     # generate a base (matrix with 7 rows with values 1 to 7)
plan1=do.call("rbind", replicate(nr, plan1, simplify=F))  # replicate the base plan
set.seed(1234)                                            # set seed for random number generator
plan1=plan1[order(sample(1:nrow(plan1))),]                # randomize design
plan1=as.data.frame(plan1)                                # make sure plan1 is dataframe
names(plan1)<- c("ma")      


{r}
#alternative test plan
plan1 <- tibble(ma = 1:7)
#replicate 300x
plan1 %>% slice(rep(1:n(), each = 300)) -> plan1
#randomize row order
set.seed(1234)
plan1<-plan1[sample(nrow(plan1)),]
# convert to dataframe
plan1=as.data.frame(plan1) 


{r}
# save as csv
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


## read test plan with results

{r}
dat1=read.delim("plan1_res.csv",header = T,dec=".", sep = ";")
dat1=transform(dat1,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat1)


## characteristic values
{r}
summary_val <- dat1 %>% group_by(ma)%>% summarise( mean = mean(val), median = median(val), std_dev = sd(val), MAD =mad(val), skewness=skewness(val),medcouple= mc(val), kurtosis= kurtosis(val),min=min(val),q25=quantile(val,0.25),q75=quantile(val,0.75),max=max(val))

summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Characteristic Value") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 


- mean values seem to be very similar except for machine 6, the same applies for the standard deviation.\
- Machine 6 has a much lower mean and standard deviation.\
- Comparing the MAD with the standard deviation, there seems to be a larger difference for machine 6, the MAD is much lower than the standard deviation, so there seem to be some outliers.\
- Skewness is near zero for machines 2,3 and 4 and machines 1,5,6 and 7 seem to be skewed.\
- Comparing the medcouple (robust) with the skewness, the medcouple is closer to zero for all machines.\
- Machine 1 and 6 still seem to be slightly skewed.\
- Kurtosis shows a very high value for machine 6, as already expected from the standard deviation, the distribution seems to be peaky.\
- Judging by Kurtosis, machines 3 and 4 seem to be close to a normal distribution.

## visualize data

### Scatterplot

{r fig.height=9}
plots <- list()             # generate an empty list
# run a loop to generate all scatter plots
for(i in ma){
  p = ggplot(data=filter(dat1,ma==i),aes(x=time,y=val)) +  geom_point() + ggtitle(paste("ma ",i)) + geom_smooth(method="auto", level=0.95)
  plots[[i]] <- p
}
# display the scatterplots
gridExtra::grid.arrange(grobs=plots,ncol=2)


- Machine 4 seems to have some positive drift over time.\
- Machines 1, 3, 5, 6 ,7 seem to have some outliers but no discernable drift.

### Density +Historgram + "theo. Dist."

{r fig.height=9}
dplots <- list()             # generate an empty list
# run a loop to generate all scatter plots
for(i in ma){
  dp = ggplot(data=filter(dat1,ma==i),aes(x=val))+geom_histogram(aes(y=..density..), binwidth=0.15,colour="black", fill="white")+geom_density() + ggtitle(paste("ma ",i)) + geom_rug(alpha = 1/5)
  dplots[[i]] <- dp
}
# display the density plots
gridExtra::grid.arrange(grobs=dplots,ncol=2)


- Machine 2 seems to be the sum of two distributions.\
- Machines 1 and 7 seem to be skewed.\
- Machine 6 is has a high peak and low standard deviation.

### Box-Plot

{r}
ggplot(data=dat1, aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5)


- Machine 1,5 and 7 seem to have outliers. Machine 2 has a wide distribution (because it is sum of two distributions).\
- Machine 6 has a very low standard deviation and much lower mean than the other data sets.

### Q-Q-Plot

{r fig.height=9}
qqplots <- list()             # generate an empty list
# run a loop to generate all scatter plots
for(i in ma){
  qqp = ggqqplot(data=filter(dat1,ma==i), x = "val") + ggtitle(paste("ma ",i))
  qqplots[[i]] <- qqp
}
# display the density plots
gridExtra::grid.arrange(grobs=qqplots,ncol=2)


- Machines 1,2,5,6 and 7 are not normal distributed.\
- Machine 4 might not be normal distributed.

## Statistical tests
- Normality with Shapiro Wilk: H~0~ Distribution is normal distributed\
- Stationary with KSPP test: H~0~ Distribution is stationary\
- Outliers with Rosner test.\

The significance level is set to  $\alpha = 0.05$

{r}
summary_val <- dat1 %>% group_by(ma)%>% summarise( shapiro_p = shapiro.test(val)$p.value, kspp_p=kpss.test(val)$p.value,n_outlier=rosnerTest(val, k = 20, alpha = 0.05, warn = F)$n.outliers,Box_Cox_lamda=powerTransform(val, family="bcPower")$lambda)
summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Statistical Test Results") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 


- normality: H~0~ has to be rejected for machine 1,2,5,6 and 7 ($p<\alpha$) and cannot be rejected for 3,4. Thus 3 and 4 could be normal distributed.\
- stationary: H~0~ has to be rejected for machine 4 ($p<\alpha$) and cannot be rejected for the rest. Thus all machines except for machine 4 could be stationary.\
- outliers: Machines 1, 5, 6, 7 seem to have outliers\
- box cox: necessary power for transformation is about -2.1 for machine 1, -0.77 for machine  5, 0.55 for machine 6. and 3.2 for machine 7.


#############2?
#############2?


Task:\

- You have eight machines (ma) for which you want to find out what they do. All machines are of the 
same kind and are supposed to do the very same, but the first four are of one brand (?? ? {1,2,3,4}) 
and the other four are of the second brand (?? ? {5,6,7,8}).\
- According to the different tasks write test plans into files.\
- The files all start with the Matrikelnumber.\
- This row is followed by a row with names with 1 column. Names: ma.\
- In the following rows follows the plan with the machines to be tested.\
- There is always 1 column. \
- Set up a test plan to investigate the machines and write the plan to a csv file.\

### Set up test plan

{r}
#alternative test plan
ma <- seq(1:8)
plan1 <- tibble(ma = ma)
#replicate
plan1 %>% slice(rep(1:n(), each = 100)) -> plan1
#randomize row order
set.seed(1234)
plan1<-plan1[sample(nrow(plan1)),]
# convert to dataframe
plan1=as.data.frame(plan1) 


{r}
# save as csv
# First line writes the MatrikelnummerQ
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


### read test plan with results
{r}
dat1=read.delim("plan1_res.csv",header = T,dec=".", sep = ";")
dat1=transform(dat1,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat1)


### Characterize all machines individually with the appropriate characteristic numbers, graphs and statistical tests. (100 replications should be appropriate.)
{r}
summary_val <- dat1 %>% group_by(ma)%>% summarise( mean = mean(val), median = median(val), std_dev = sd(val), MAD =mad(val), skewness=skewness(val),medcouple= mc(val), kurtosis= kurtosis(val),min=min(val),q25=quantile(val,0.25),q75=quantile(val,0.75),max=max(val))

summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Characteristic Value") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 

For all machines the mean and median seems to be about the same.\
Standard deviation and MAD also seem to be about the same except for a slight deviation for machine 1 and 5.\
There seem to be some differences between skewness and medcouple for machines 5, 6, 7, 8\
Kurtosis for machine 7 is quite high. The other machines seem to have a kurtosis close to 0.\

### Visualize the datasets

#### Scatterplot


{r fig.height=9}
plots <- list()
for(i in ma){
  p = ggplot(data=filter(dat1,ma==i),mapping = aes(x=time,y=val)) +  geom_point() + ggtitle(paste("ma ",i))
  plots[[i]] <- p
}
gridExtra::grid.arrange(grobs=plots,ncol=2)

Data looks unsuspicous. Machine 7 might have an outlier.

#### Density plot

{r fig.height=9}
dplots <- list()
for(i in ma){
  dp = ggplot(data=filter(dat1,ma==i),mapping = aes(x=val))+geom_histogram(aes(y=..density..), binwidth=0.3,colour="black", fill="white")+geom_density() +
  stat_function(fun = dnorm, n = 101, args = list(mean = as.numeric(summary_val[i,2]), sd = as.numeric(summary_val[i,4])), colour = "red") + ggtitle(paste("ma ",i)) + geom_rug(alpha = 1/5)
  dplots[[i]] <- dp
}
gridExtra::grid.arrange(grobs=dplots,ncol=2)

machine 7 seems to have an outlier. Other than that the data looks unsuspicious.

#### Box-Plot

{r}
ggplot(data=dat1,mapping = aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5) 


The machines could be all the same, but it is hard to tell.\
There might be some outliers. Exspecially machine 7 seems to have one.\

#### Q-Q-Plot

{r fig.height=9}
qqplots <- list()
for(i in ma){
  qqp = ggqqplot(data=filter(dat1,ma==i), x = "val") + ggtitle(paste("ma ",i))
  qqplots[[i]] <- qqp
}
gridExtra::grid.arrange(grobs=qqplots,ncol=2)

Machine 7 seems to have an outlier.\
machines 1, 4, 5, 6 might not be normal distributed.\
Other than that the data is unsuspicous.\

### statistical tests before comparison of machines
-test for normality: shapiro-wilk-test -> H~0~: distribution is normal distributed\
-testing if stationary: KSPP test -> H~0~: distribution is stationary\
-testing for outliers: Rosner test -> H~0~: there are no outliers in the distribution\
-testing necessary power for Box Cox transformation to normal distribution -> powerTransform

the significance level for all tests is set to alpha=5%\

#### test for normality with shapiro-wilk-test

{r}
summary_val <- dat1 %>% group_by(ma)%>% summarise( shapiro_p = shapiro.test(val)$p.value, kspp_p=kpss.test(val)$p.value,n_outlier=rosnerTest(val, k = 3, alpha = 0.05, warn = F)$n.outliers,Box_Cox_lamda=powerTransform(val, family="bcPower")$lambda)
summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Statistical Test Results") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 

for machines 1,2,3,4,8 H~0~ for normal distribution cannot be rejected. They could be normal distirbuted.\
machine 5 is very close to alpha value -> no clear decision regarding H~0~ can be made.\
for machines 6 and 7 H~0~ can be rejected they don't seem to be normal distributed\
\
all distributions seem to stationary as p-value of KSPP is above alpha.\
\
only machine 7 seems to have one outlier.\
\
the power for Box-Cox-Transformation is close to 1 for machines 1 to 4. Machines 5 to 8 is close to zero and should be transformed to be closer to normal distribution.\


###compare machines


#### Do machines 1 and 2 have the same performance?

##### graphcial

One way of graphical comparison is the Box plot\

{r}
ggplot(data=filter(dat1,ma==1 | ma==2), aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5)


Another way is to overlay the density plots.\

{r}
ggplot(data=filter(dat1,ma==1 | ma==2),mapping = aes(x=val,color=ma)) + geom_density() + geom_rug()

##### hypothesis test

H~0~ machines 1 and 2 have the same variance.\
significance level $\alpha=5\%"\

{r}
var.test(unlist(filter(dat1,ma==1)[3]), unlist(filter(dat1,ma==2)[3]))




The p-value is above $\alpha$ $\Rightarrow$ H~0~ cannot be rejected.\
The machine 1 and 2 seem to have the same variance.

H~0~ machines 1 and 2 are the same.\
significance level $\alpha=5\%"\

{r}
t.test(filter(dat1,ma==1)[3], filter(dat1,ma==2)[3], conf.level = 0.95,var.equal =T)


The p-value is above $\alpha$ $\Rightarrow$ H~0~ cannot be rejected.\
The machine 1 and 2 seem to have the same performance.

Alternative the Welch-Test

H~0~ machines 1 and 2 are the same.\
significance level alpha=5%\

{r}
t.test(filter(dat1,ma==1)[3], filter(dat1,ma==2)[3], conf.level = 0.95,var.equal =F)


The p-value is above $\alpha$ $\Rightarrow$ H~0~ cannot be rejected.\
The machine 1 and 2 seem to have the same performance.




### Do machines 5 and 6 have the same performance?
{r}
ggplot(data=filter(dat1,ma==5 | ma==6), aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5)

Performance seems to be similar.\

{r}
ggplot(data=filter(dat1,ma==1 | ma==2),mapping = aes(x=val,color=ma)) + geom_density() + geom_rug()

Densityplot confirms a very similar performance of the machines.\

##### hypothesis test

H~0~: machines 5 and 6 perform the same\

sign. level: alpha=5%\

wilcoxon test for non-parametric machine 5 and 6

{r}
dat1s1=filter(dat1,ma==5 | ma==6)
wilcox.test(dat1s1$val~dat1s1$ma, alternative = "two.sided",paired = F)

p-value of 0.45 is above set alpha -> H~0~ cannot be rejected\
-> machines seem to have the same performance\

### Do machines 1 to 3 have the same performance?

{r}
ggplot(data=filter(dat1,ma==1 | ma==2 |ma==3), aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5)


there seems to be a slight difference in performance, though the standard deviation seems have a slight overlap\
-> perform other tests for more certain analysis.\


test variance for further analysis (3 data sets can be tested for the same variance with the bartlett test)

H~0~ machines 1 to 3 have the same variance.\
significance level $\alpha=5\%"\

{r}
dat1s2=filter(dat1,ma==1 | ma==2| ma==3)
bartlett.test(dat1s2$val~dat1s2$ma)

p-value is higher than alpha -> H~0~ cannot be rejected.\
Datasets seem to have the same variance.\

Perform Anova to test for same performance of more than 2 datasets with same variance
H~0~: machines 1 to 3 perform the same\
sign. level alpha=5%\

{r}
res.aov<-aov(val~ma,data = dat1s2)
summary(res.aov)

p-value of 0.00778 is below alpha value -> H~0~ rejected\
-> machines don't seem to perform the same\


### Do machines 5 to 7 have the same performance?


{r}
ggplot(data=filter(dat1,ma==5 | ma==6 | ma==7), aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5)


Machine 7 might perform slightly better than the others, hard to tell as variance overlaps\

testing 3 data sets at once for same performance requires the ANOVA test for parametric distributions (normal distr.)\
In this case the datasets 6 and 7 are non-parametric -> Kruskal test 

H~0~: machines 5, 6 and 7 perform the same\

sign. level alpha=5%

{r}
dat1s3=filter(dat1,ma==5 | ma==6 | ma==7)
kruskal.test(val~ma,data = dat1s3)

p-value of test is higher than alpha value -> H~0~ cannot be rejected\
-> machines 5 to 7 seem to perform the same\

#############3?
#############3?

You have three machines (ma). Two old ones and one new one. (Use: Ex3T1.exe)\

1.Determine the performance of the first machine with a relative error of less than 2 %. 
Approach the solution in two steps and verify it.\

## Screening for power analysis

### create test plan for screening
{r}
#alternative test plan
plan1 <- tibble(ma = 1)
#replicate
plan1 %>% slice(rep(1:n(), each = 6)) -> plan1
#randomize row order
set.seed(1234)
plan1<-plan1[sample(nrow(plan1)),]
# convert to dataframe
plan1=as.data.frame(plan1) 


{r}
# save as csv
# First line writes the MatrikelnummerQ
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


## read back data
{r}
dat1=read.delim("plan1_res.csv",header = T,dec=".", sep = ";")
dat1=transform(dat1,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat1)


## "power analysis" for 0D distribution (measure one point of one machine wihtout varying parameter)
{r}
me1=mean(filter(dat1,ma==1)$val) # calculate mean
sd1=sd(filter(dat1,ma==1)$val) # calculate standard deviation
nt=ceiling((sd1/me1/0.02)^2) # round up number of experiments; 2% relative error


necessary number of experiments is `r nt`

## test plan from power analysis
{r}
#alternative test plan
plan2 <- tibble(ma = 1)
#replicate
plan2 %>% slice(rep(1:n(), each = nt)) -> plan2
#randomize row order
set.seed(1234)
plan2<-plan2[sample(nrow(plan2)),]
# convert to dataframe
plan2=as.data.frame(plan2) 


{r}
# save as csv
# First line writes the MatrikelnummerQ
write.table(matrikelnumber,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes th>e test plan
write.table(plan2,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)

## read back data from second test with number of experiments from power analysis
{r}
dat2=read.delim("plan2_res.csv",header = T,dec=".", sep = ";")
dat2=transform(dat2,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat2)


### verify that relative error is <= 2%
{r}
me2=mean(filter(dat2,ma==1)$val) # calculate mean
sd2=sd(filter(dat2,ma==1)$val) # calculate standard deviation
re2=(sd2/me2/sqrt(nrow(dat2)))
re2

The achieved relative error `r re2` is below the goal of 2%.\


2.In a second run you want to verify with 95 % certainty that the second machine is having the 
same performance allowing for a maximum deviation of 5 % error of the first machine.\


## start with a power analysis to determine the number of experiments needed to compare performance of machine 1 and 2

{r}
dm=me2*0.05/sd2 #effect size
nt2=ceiling(pwr.t.test(n=NULL,d=dm, sig.level = 0.05, power = 0.95, type = "two.sample", alternative = "two.sided")$n)
nt2

There are `r nt2` test points for each machine needed.

## create test plan with `r nt2` experiments
{r}
#alternative test plan
ma = seq(1:2)
plan3 <- tibble(ma = ma)
#replicate
plan3 %>% slice(rep(1:n(), each = nt2)) -> plan3
#randomize row order
set.seed(1234)
plan3<-plan3[sample(nrow(plan3)),]
# convert to dataframe
plan3=as.data.frame(plan3) 


{r}
# save as csv
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan3.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes th>e test plan
write.table(plan3,file="plan3.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


## read back data from third test with number of experiments from power analysis
{r}
dat3=read.delim("plan3_res.csv",header = T,dec=".", sep = ";")
dat3=transform(dat3,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat3)


## now compare the two machines

### visual comparison

#### generate scatterplot and densityplot

{r fig.height=9}
ggplot(data=dat3,mapping = aes(x=time,y=val,color=ma)) +  geom_point()

Data seems unsuspicious. Both machines might have some outliers. Both machines look very similar.


{r fig.height=9}
ggplot(data=dat3,mapping = aes(x=val,color=ma)) +geom_density() + geom_rug()

Machine 2 seems to perform better than machine 1.

#### Box-Notch plot

{r}
ggplot(data=dat3,mapping = aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5) 

Both machines might have two outlierts. Both machines perform very similar, machine 2 might perform slightly better.

#### QQ-Plot

{r}
ggqqplot(data=dat3, x = "val", color = "ma") 


Machine 2 might have deviations from the normal distribution.

### statistical comparison of machine 1 and 2

-Test for normality with shapiro-wilk test: H~0~ distribution is normal distributed\
-Test is distribution is stationary with KSPP test: H~0~ distribution is stationary\
-Outliers with Rosner Test\

signif. level is set to alpha=0.05\

{r}
summary_val <- dat3 %>% group_by(ma)%>% summarise( shapiro_p = shapiro.test(val)$p.value, kspp_p=kpss.test(val)$p.value,n_outlier=rosnerTest(val, k = 3, alpha = 0.05, warn = F)$n.outliers)
summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Statistical Test Results") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 

-for both machines H~0~ for normal distribution cannot be rejected as p value is > alpha\
-KSPP test: H~0~ cannot be rejected for both machines as p value is > alpha -> Data seems stationary\
-both machines don't seem to have any outliers

#### test if performance of machine 1 and 2 is the same with t.test with 95% certainty and 5% relative error allowed
H~0~: machines 1 and 2 are the same\

significance level alpha=0.05\

{r}
t.test(filter(dat3,ma==1)[3],filter(dat3,ma==2)[3],alternative="two.sided",var.equals=F,conf.level=0.95)

p-value of 0.52 is higher than set alpha value -> machines 1 and 2 seem to perform the same



3.The third machine is new and is claimed to be at least 10% better than the first one. Test this 
with 95 % certainty\

## start with a power analysis to determine the number of experiments needed to compare performance of machine 1 and 3

{r}
me3=mean(filter(dat3,ma==1)$val) # calculate mean
sd3=sd(filter(dat3,ma==1)$val) # calculate standard deviation
dm2=me3*0.1/sd3 #effect size
nt3=ceiling(pwr.t.test(n=NULL,d=dm2, sig.level = 0.05, power = 0.95, type = "two.sample", alternative = "two.sided")$n)
nt3

There are `r nt3` test points for each machine needed.

## create test plan with `r nt3` experiments
{r}
#alternative test plan
ma = c(1,3)
plan4 <- tibble(ma = ma)
#replicate
plan4 %>% slice(rep(1:n(), each = nt3)) -> plan4
#randomize row order
set.seed(1234)
plan4<-plan4[sample(nrow(plan4)),]
# convert to dataframe
plan4=as.data.frame(plan4) 


{r}
# save as csv
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan4.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes th>e test plan
write.table(plan4,file="plan4.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


## read back data from third test with number of experiments from power analysis
{r}
dat4=read.delim("plan4_res.csv",header = T,dec=".", sep = ";")
dat4=transform(dat4,ma=as.factor(ma))                     # transform the machine number from a numerical to a factor for categorical
head(dat4)


## now compare the two machines

### visual comparison

#### generate scatterplot and densityplot

{r fig.height=9}
ggplot(data=dat4,mapping = aes(x=time,y=val,color=ma)) +  geom_point()

Data seems unsuspicious. Machine 3 seems to perform better than machine 1\


{r fig.height=9}
ggplot(data=dat4,mapping = aes(x=val,color=ma)) +geom_density() + geom_rug()

Machine 3 seems to perform better than machine 1.

#### Box-Notch plot

{r}
ggplot(data=dat4,mapping = aes(y=val,ma)) + geom_boxplot(notch = TRUE, notchwidth = .5) 

machine 3 seems to perform better than machine 1.

#### QQ-Plot

{r}
ggqqplot(data=dat4, x = "val", color = "ma") 


Both machine distributions seem normal distributed without outliers.

### statistical comparison of machine 1 and 3

-Test for normality with shapiro-wilk test: H~0~ distribution is normal distributed\
-Test is distribution is stationary with KSPP test: H~0~ distribution is stationary\
-Outliers with Rosner Test\

signif. level is set to alpha=0.05\

{r}
summary_val <- dat4 %>% group_by(ma)%>% summarise( shapiro_p = shapiro.test(val)$p.value, kspp_p=kpss.test(val)$p.value,n_outlier=rosnerTest(val, k = 3, alpha = 0.05, warn = F)$n.outliers)
summary_val %>% mutate_if(is.numeric, format, digits=3,nsmall = 1) %>%
  kbl(.,"html",align = "r",caption = "Statistical Test Results") %>%   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 

-for both machines H~0~ for normal distribution cannot be rejected as p value is > alpha\
-KSPP test: H~0~ cannot be rejected for both machines as p value is > alpha -> Data seems stationary\
-both machines don't seem to have any outliers

#### test if performance of machine 3 is at least 10% better than machine 1 with t.test with 95% certainty
H~0~: The difference between machine 3 and 1 at least 10% of the mean of machine 1.\

significance level alpha=0.05\

{r}
m1=mean(filter(dat4,ma==1)$val)
m3=mean(filter(dat4,ma==3)$val)
# mu is the anticipated difference between data sets, REIHENFOLGE DER MASCHINEN SPIELT EINE ROLLE
t.test(filter(dat4,ma==3)[3],filter(dat4,ma==1)[3],mu=0.1*m1,alternative="less",var.equals=F,conf.level=0.95)

p-value of near 1 is much higher than set alpha value -> machine 3 seems to perform at least 10% better than machine 1



# Exercise 2

You have a new measurement device which you want to quality following the gage R&R analysis
together with two colleagues. (Use: Ex3T2.exe)\

1. Set up a test plan for doing the gage R&R.\

2. Evaluate the result. Is the measurement system acceptable\

## Generate test plan with operators and parts

{r}
op=seq(1,3)                                               # number of operators
pa=seq(1,5)                                               # number of parts
nr=3                                                      # number of replicates
plan5=expand.grid(op,pa)                                  # generate a base plan
plan5=do.call("rbind", replicate(nr, plan5, simplify=F))  # replicate the base plan
set.seed(1234)                                            # set seed for random number generator
plan5=plan5[order(sample(1:nrow(plan5))),]                # randomize design
plan5=as.data.frame(plan5)                                # make sure plan1 is dataframe
names(plan5)<- c("op","pa")                               # name the variables


{r}
# save as csv
# First line writes the MatrikelnummerQ
write.table(matrikelnumber,file="plan5.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan5,file="plan5.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)


## read test plan with results
{r}
dat5=read.delim("plan5_res.csv",header = T,dec=".", sep = ";")
dat5=transform(dat5,op=as.factor(op),pa=as.factor(pa))                     # transform the machine number from a numerical to a factor for categorical
head(dat5)


### do an analysis of variance (linear regression model) to test the effect of operator and parts on val

H~0~: parts and operators don't have an influence on val

{r}
aov_model <- aov(val~pa*op,data = dat5)
#aov_model$coefficients
summary(aov_model)


As p-values for pa and op is < alpha these factors both seem to have a significant influence on val so H~0~ is rejected. For the interaction of parts and operators the p-value is > alpha so H~0~ cant be rejected. The interaction doesn't seem to have an influence on val.

### do an gage R&R Analysis

{r fig.height=9}
my.rr <- ss.rr(var = val, part = pa, appr = op, data = dat5, main = "Six Sigma Gage R&R Measure", sub = "Qualify M-Device")


Total Gage R&R standard deviation is below 1% and the study variation is below 9%.\
According to DOE: R&R variation of study variance < 10% and contribution variance < 1%\
Thus the measurement system is considered acceptable.


#############4?
#############4?


#############5?
#############5?


#############6?
#############6?



# }

}
\keyword{univar}