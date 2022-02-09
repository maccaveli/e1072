\name{size.anova8}
\alias{size.anova8}
\title{
Design of Experiments for ANOVA
}
\description{
  This function provides access to several functions returning the
  optimal number of levels and / or observations in different types of
  One-Way, Two-Way and Three-Way ANOVA.
}
\usage{
size.anova(model, hypothesis = "", assumption = "",
    a = NULL, b = NULL, c = NULL, n = NULL, alpha, beta, delta, cases)
}

\arguments{
  \item{model}{
    A character string describing the model, allowed characters are
    \code{(>x)} and the letters \code{abcABC}, capital letters stand for
    random factors, lower case letters for fixed factors, \code{x} means
    cross classification, \code{>} nested classification, brackets
    \code{()} are used to specify mixed model, the term in brackets has
    to come first. Spaces are allowed.

    Examples: One-Way fixed: \code{a}, Two-Way: \code{axB}, \code{a>b},
    Three-Way: \code{axbxc}, \code{axBxC}, \code{a>b>c}, \code{(axb)>C}, ...
}
  \item{hypothesis}{
    Character string describiung Null hypothesis, can be omitted in
    most cases if it is clear that a
    test for no effects of factor A is performed, \code{"a"}.

    Other possibilities: \code{"axb"}, \code{"a>b"}, \code{"c"} and some more.
}
\item{assumption}{
   Character string. A few functions need an assumption on sigma, like
   \code{"sigma_AB=0,b=c"}, see the referenced book until this page is updated.
 }
  \item{a}{
    Number of levels of fixed factor A
  }
  \item{b}{
    Number of levels of fixed factor B
  }
  \item{c}{
    Number of levels of fixed factor C
  } 
  \item{n}{
    Number of Observations
  }
  \item{alpha}{
    Risk of 1st kind
  }
  \item{beta}{
    Risk of 2nd kind
  }
  \item{delta}{
    The minimum difference to be detected
  }
  \item{cases}{
    Specifies whether the \code{"maximin"} or \code{"maximin"} sizes are
    to be determined. 
  }

}
\details{
  see chapter 3 in the referenced book
}
\value{
  named integer giving the desired size(s)
}
\references{
Dieter Rasch, Juergen Pilz, L.R. Verdooren, Albrecht Gebhardt: Optimal Experimental Design with R, Chapman and Hall/CRC, 2011
}
\author{
Dieter Rasch, Juergen Pilz, L.R. Verdooren, Albrecht Gebhardt, Minghui Wang
}
\note{
  Depending on the selected model and hypothesis omit one or two of the
  sizes \code{a}, \code{b}, \code{c}, \code{n}. The function then tries
  to get its optimal value. 
}


\examples{
size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="maximin")
size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="minimin")

size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")
size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")

size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")
size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")

size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="maximin")
size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="minimin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=2, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="a>B>c", hypothesis="c",a=6, b=20, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=NA, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")





























\dontrun{










#########8##
You get a new machine into your company. You have five factors that can be manipulated between 0
and 2. And you assume that interactions between two factors can be relevant. However, you are sure
that three factor interaction do not play any role. You are asked to run a minimum of tests for the
start, but to have at least 3 replications

## 8.1.1 What is the right resolution for this problem?
5 factors that can be manipulated. Two-fold interactions are relevant, three-fold interactions are not relevant -> resolution should be at least 5, because with a resolution of 4 still the twofold interactions are confounded (2*2=4).
With a resolution of 5 and 5 factors with 2 levels, the necessary number of runs is 2^(5-1)=16.
## 8.1.2 How many experiments do you need?
## 8.1.3 Set up a test plan to investigate the machine and write the plan to a csv file that has your Matrikelnummer prior to the plan.
## 8.1.5 Analyse the new performance data. (1 model) -> linear model
## 8.1.6 Find the smallest reasonable model
## 8.1.7 Verify that this smallest reduced model is sufficient with a second method (ANOVA)
## 8.1.8 Estimate the number of experiments to have errors below 1proz
## OPTIONAL: What happens when the resolution is too low?













size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="maximin")
size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="minimin")

size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")
size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")

size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")
size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")

size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="maximin")
size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="minimin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=2, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="a>B>c", hypothesis="c",a=6, b=20, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=NA, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")





## 8.1.1 What is the right resolution for this problem?
5 factors that can be manipulated. Two-fold interactions are relevant, three-fold interactions are not relevant -> resolution should be at least 5, because with a resolution of 4 still the twofold interactions are confounded (2*2=4).
With a resolution of 5 and 5 factors with 2 levels, the necessary number of runs is 2^(5-1)=16.

## 8.1.2 How many experiments do you need?
```{r}
nex=nrow(FrF2(resolution = 5, nfactors=5,clear=TRUE, res3=TRUE))
```
The number of experiments is `r nex`.

## 8.1.3 Set up a test plan to investigate the machine and write the plan to a csv file that has your Matrikelnummer prior to the plan.
Generate a fractional factorial plan.
```{r}
nr=3 #at least 3 replications stated.
plan1=FrF2(nex,5,replication=nr,default.levels = c(0, 2),randomize = T)
```

Write test plan to file
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan_81.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan_81.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

```{r}
dat1 = read.delim("plan_81_res.csv", header = TRUE,sep = ";", dec = ".")
# head(dat1)
```

#### have a first look at the data
```{r}
head(dat1)
```

#### Check class of variables
```{r}
map_df(dat1, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```

#### check if there is an NA for any machine
```{r}
dat1 proz>proz summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

### Have first glance at the data

#### Scatter Plot
```{r fig.height=9}
dat1 proz>proz ggplot(data=.,mapping = aes(x=time,y=measured)) +  geom_point() + ggtitle("Scatterplot for Machine")
```

The data show no suspicious elements in the scatterplot. There doesn't seem to be any time drift.

H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$

```{r warning=F}
summary_kpss <- dat1 proz>proz  summarise(kpss_p=kpss.test(measured)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```

H~0~ cannot be rejected because ($p>\alpha$ ).\
Data seem to be stationary.

```{r message=F}
my_fn <- function(data, mapping, ...){
  p <- ggplot(data = data, mapping = mapping) + 
    geom_point() + 
    geom_smooth(method=lm, fill="blue", color="blue", ...)
  p
}
dat1proz>proz ggpairs(., lower = list(continuous = my_fn))
```
There seems to be a large Effect from factors A and B on the measured value. C,D,E don't seem to have an effect on measured.

## 8.1.5 Analyse the new performance data. (1 model) -> linear model
H~00~: Time has no effect\
H~01~: A has no effect\
H~02~: B has no effect\
H~03~: C has no effect\
H~04~: D has no effect\
H~05~: E has no effect\
H~06~: time*A has no effect\
H~07~: time*B has no effect\
H~08~: time*C has no effect\
H~09~: time*D has no effect\
H~10~: time*E has no effect\
H~11~: A*B has no effect\
H~12~: A*C has no effect\
H~13~: A*D has no effect\
H~14~: A*E has no effect\
H~15~: B*C has no effect\
H~16~: B*D has no effect\
H~17~: B*E has no effect\
H~18~: C*D has no effect\
H~19~: C*E has no effect\
H~20~: D*E has no effect\
significance level  $\alpha=0.05$\
```{r}
fullmodel=lm(measured~.^2,data=dat1) # linear model including all two-fold factor interactions (.^3 would include three-fold interactions, but only two-fold is of interest)
summary(fullmodel)
```
For nearly all effect and interactions with p>$\alpha$ the Null Hypothesis cannot be rejected.
Only for H~01~, H~02~, H~06~, H~11~ this is not the case. The p-value of H~07~ is very close to alpha and should be investigated further.

#### visualize effects and interactions
```{r}
dat <- dat1[-1]
fullmodel=lm(measured~.^2,data=dat) # linear model including all two-fold factor interactions (.^3 would include three-fold interactions, but only two-fold is of interest)
summary(fullmodel)
```

```{r}
MEPlot(fullmodel)
```
A and B have large effect. And C, D and E seem to be less relevant.

```{r}
IAPlot(fullmodel)
```
Only the interaction of A and B seems to be relevant.

## 8.1.6 Find the smallest reasonable model
### manually reduce model
Check with the BIC, if time and factors C,D,E might be needed in a reduced model.
```{r}
stepAIC(fullmodel,k=log(nrow(dat1)),direction = "both",trace = 0)
```
Time can't be eliminated as the two-fold interaction time:B seems to be important for the model. C,D,E can be eliminated as they don't appear in the reduced model of the BIC.

```{r}
dat1<-dat1[c(-4,-5,-6)]
```

Rerun the above model without C,D,E:
H~00~: time has no effect\
H~01~: A has no effect\
H~02~: B has no effect\
H~03~: time:A has no effect\
H~04~: time:B has no effect\
H~05~: A:B has no effect\
significance level  $\alpha=0.05$\
```{r}
reducModel1=lm(measured~.^2,data=dat1) # linear model including all two-factor interactions
summary(fullmodel)
```
All Null-Hypoth. except H~00~ and H~03~ need to be rejected.

Reduce model by removing interaction time:A but keeping interaction time:B:
H~00~: time has no effect\
H~01~: A has no effect\
H~02~: B has no effect\
H~03~: time:B has no effect\
H~04~: A:B has no effect\
significance level  $\alpha=0.05$\
```{r}
reducModel2=lm(measured~time+A+B+time*B+A*B,data=dat1) # linear model including all two-factor interactions
summary(fullmodel)
```
All Null-Hypothesis need to be rejected except H~00~ as p(H~00~)>alpha. 

compare manually reduced model with fullmodel:
```{r}
anova(fullmodel,reducModel2)
```

### automatically reduce model
find optimal model using AIC.
```{r}
stepa<-stepAIC(fullmodel,direction = "both",k=2,trace=0)
stepa$anova
```
find optimal model using BIC
```{r}
stepm<-stepAIC(fullmodel,direction = "both",k=log(nrow(dat1)),trace=0)
stepm$anova
```
The optimum model following the BIC is: measured ~ time + A + B + time:B + A:B

## 8.1.7 Verify that this smallest reduced model is sufficient with a second method (ANOVA)
Setup a reduced model:
H~01~: time has no effect\
H~02~: A has no effect\
H~03~: B has no effect\
H~04~: time:B has no effect\
H~05~: A:B has no effect\
significance level  $\alpha=0.05$\
```{r}
model1=lm(measured ~ time + A + B + time:B + A:B ,data=dat1) # linear model including all factor interaction
summary(model1)
```
All hypothesis cannot be rejected, because p>0.05.

H~0~:$model1$ has same predictive value as the $fullmodel$ \
significance level  $\alpha=0.05$\
```{r}
anova(model1,fullmodel) # comparing Reduced model with full model
```
$\because p>\alpha \Rightarrow$, I cannot reject H~0~.\
The models seem to perform equally good.

## 8.1.8 Estimate the number of experiments to have errors below 1proz
Estimate the number of experiments per level.
```{r}
r2=summary(model1)$r.squared
f=r2/(1-r2)
uf=5 # (6 factors and interactions and intercept - 1)
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n2=ceiling(p_res$v+uf+1)
```
The estimation for number of experiments/total samples needed is `r n2`.

A second power analysis
```{r}
de1=as.data.frame(abs(coefficients(model1))/coef(summary(model1))[, "Std. Error"])  proz>proz filter(row_number() >= 2)
de1<-de1/sqrt(nr)
colnames(de1)<-c("delta")
del_es<-de1 proz>proz min()
del_es=min(del_es,3)proz>prozsignif(., digits = 4) # size.anova does not work for to small delta
r2=summary(model1)$adj.r.squared
f=r2/(1-r2)
del_r2=2*sqrt(f/nrow(dat1))
np=size.anova("axb",a=2,b=2,alpha=0.01,delta=del_es , beta=0.01,case="maximin")
np
```

The number of experiments/number of samples is `r np`.
```{r}
del_es
del_r2
```
del_es and del_r2 are the number of replications necessary.

## 8.1.9 Verify the assumptions made for the last model.
### Test the normality of the residuals.
#### Do a qq-plot
```{r}
ggqqplot(model1$residuals)
```
Residuals seem to be nearly normal distributed, but there are some deviations.

#### Shaprio Wilk Test for normality of residuals
H~0~ Residuals are normal distributed.\
significance level: $\alpha=5\proz$\
```{r}
shapiro.test(model1$residuals)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals are normal distributed.\

### Test the homogenity of the residuals (Homoscedasticity)\
#### spread-level-plot
```{r warning=F}
spreadLevelPlot(model1)
```
The residuals look homogeneous.


#### hypothesis test for homogenity
H~0~ residuals are homogeneous distributed\
significance level: $\alpha=5\proz$

```{r}
ncvTest(model1)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals are homogeneous.\

### Look for high leverage outliers
#### Calculate the critical Cooks distance.
```{r}
cd1c=4*2/length(model1$residuals)  #corrected by dimension of model (quadratic=2)
cd1=abs(cooks.distance(model1))
subset(cd1, cd1 > cd1c)
```
There seem to be some high leverage outliers

#### do InfluenceIndexPlot
```{r warning=F}
influenceIndexPlot(model1, vars=c("Cook", "hat"),id=list(n=3))
```
There seem to be some high leverage outliers e.g. Index 4, 11, 23.

### Check for autocorrelation
#### acf plot
```{r}
acf(model1$residuals)
```
There seems to be slight auto correlation in the residuals.

#### do a Durbin Watson Test
H~0~ residuals are not autocorrelated\
significance level: $\alpha=5\proz$

```{r}
durbinWatsonTest(model1)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals show no auto correlation.\

### Testing for Multicollinearity
#### Do a generalized pairs plot to spot correletations
```{r , message=F}
ggpairs(model1)
```
no correlation between the variables is seen.

####  do a Multicollinearity test
H~0~ Data are not multi collinar\
```{r}
vif(model1)
```
All values except for B and time:B are below 4
All vif values are below 10, i.e. there are no serious multicollinearity problems.

```{r}
library(performance)
check_collinearity(model1)
```
there seems to be moderate correlation for B and time:B.


```{r}
library(mctest)
omcdiag(model1)
imcdiag(model1)
```

## OPTIONAL: What happens when the resolution is too low?

If we choose: Resolution 3\
The model we target for is something like:\
$𝑦\sim 𝑥_0+𝑥_1 𝐴+𝑥_2 𝐵+𝑥_3 𝐶+𝑥_4 𝐷+𝑥_5 𝐸+𝑥_6 𝐴𝐵+𝑥_7 𝐴𝐶$\
However, if we do not specify anything R might choose other interactions.

```{r}
nexa=nrow(FrF2(resolution = 3, nfactors=5,clear=TRUE, res3=TRUE))
```
The number of experiments is `r nexa`.

Generate a fractional factorial plan.
```{r}
plan1a=FrF2(nexa,5,replication=3,default.levels = c(0, 2),randomize = T)
```

Write test plan to file
```{r echo=F, message=F, warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan_81a.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1a,file="plan_81a.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

Read data
```{r}
dat1a = read.delim("plan_81a_res.csv", header = TRUE,sep = ";", dec = ".")
# head(dat1a)
dat1a<-dat1a[-1] # eliminate time
```

#### have a first look at the data
```{r}
datatable(dat1a)
```

#### Check class of variables
```{r}
map_df(dat1a, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```

#### check if there is an NA for any machine
```{r}
dat1a proz>proz summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```
Carry out a Linear Model\
H~01~: A has no effect\
H~02~: B has no effect\
H~03~: C has no effect\
H~04~: D has no effect\
H~05~: E has no effect\
H~06~: A*B has no effect\
H~07~: A*C has no effect\
H~08~: A*D has no effect\
H~09~: A*E has no effect\
H~010~: B*C has no effect\
H~011~: B*D has no effect\
H~012~: B*E has no effect\
H~013~: C*D has no effect\
H~014~: C*E has no effect\
H~015~: D*E has no effect\
significance level  $\alpha=0.05$\
```{r}
fullmodela=lm(measured~.^2,data=dat1a) # linear model including all factor interaction
summary(fullmodela)
```
Since the resolution is insufficient the interactions are not resolved.

```{r}
MEPlot(fullmodela)
``'
Since the effect D is confounded with the interaction A:B is seems that D has a effect despite the fact that it does not.


 
















size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="maximin")
size.anova(model="a",a=4,
      alpha=0.05,beta=0.1, delta=2, case="minimin")

size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")
size.anova(model="axb", hypothesis="a", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="maximin")

size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")
size.anova(model="axb", hypothesis="axb", a=6, b=4, 
           alpha=0.05,beta=0.1, delta=1, cases="minimin")

size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="maximin")
size.anova(model="axBxC",hypothesis="a",
           assumption="sigma_AC=0,b=c",a=6,n=2,
           alpha=0.05, beta=0.1, delta=0.5, cases="minimin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=2, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="a>B>c", hypothesis="c",a=6, b=20, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="a>B>c", hypothesis="c",a=6, b=NA, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")

size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="maximin")
size.anova(model="(axb)>c", hypothesis="a",a=6, b=5, c=4, 
           alpha=0.05, beta=0.1, delta=0.5, case="minimin")









}

}
\keyword{ anova }

