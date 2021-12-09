\name{size.anova2}
\alias{size.anova2}
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

Setting: You have a set of vertical machining centres VC560 (ma). The main process parameters are:\
cutting speed (vc (m/min)), feed rate (fz (mm/tooth)), depth of cut (ap (mm)).\
The process is running with the following parameters:\

```{r, echo=FALSE}
tabl <- " 
| Process parameter | vc (m/min) | fz (mm/tooth) | ap (mm) |
|-------------------|:----------:|:-------------:|:-------:|
| Min. value        |    140     |      0.2      |   0.82  |
| Current process   |    165     |      0.3      |   2.00  |
| Max. value        |    190     |      0.4      |   3.18  |
"
cat(tabl) # output the table in a format good for HTML/PDF/docx conversion
```

The target is to have a minimal roughness (ra (μm)).\
You will be asked to write down several plans in the following.\
These plans have all the same structure. The file starts with the Matrikelnumber.\
This row is followed by a row with the column names: ma, vc, fz, ap.\
In the following rows follows the plan with the levels. There are always 4 columns.\

Tasks:\
In the first step one machine is characterized on the current process\

# Set Matrikelnumber 
```{r}
matrikelnumber=1
```

# 1. Characterize the current roughness with a relative precision of 5 perc. Do this in two steps. Setup appropriate test plans, analyse them, and check, if the target relative precision is achieved.

## create test plan for screening and read back results

```{r}
ma=c(1)
vc=c(165)
fz=c(0.3)
ap=c(2.0)
nr=10
plan1=expand.grid(ma,vc,fz,ap)
plan1=do.call("rbind", replicate(nr, plan1, simplify=F))
names(plan1)<- c("ma","vc","fz","ap") # to names the variables
set.seed(1234) # set seed for random number generator
plan1=plan1[order(sample(1:nrow(plan1))),] # randomize design
```

### Write test plan1 
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read data 
```{r}
dat1=read.delim("plan1_res.csv",header = T,dec=".", sep = ";")
dat1=transform(dat1,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat1)
```

## estimate number of experiments for relative precision of 5 perc.

```{r}
me=mean(dat1$ra)
sde=sd(dat1$ra)
np=ceiling((sde/(0.05*me))^2)
```

estimated number of experiments for relative precision of <=5perc is  `r np`.

## create second test plan with estimated number of replications

```{r}
ma=c(1)
vc=c(165)
fz=c(0.3)
ap=c(2.0)
nr=np
plan2=expand.grid(ma,vc,fz,ap)
plan2=do.call("rbind", replicate(nr, plan2, simplify=F))
names(plan2)<- c("ma","vc","fz","ap") # to names the variables
set.seed(1234) # set seed for random number generator
plan2=plan2[order(sample(1:nrow(plan2))),] # randomize design
```

### Write test plan1 
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan2,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read data 
```{r}
dat2=read.delim("plan2_res.csv",header = T,dec=".", sep = ";")
dat2=transform(dat2,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat2)
```

## test if relative precision was achieved
```{r}
me=mean(dat2$ra)
sde=sd(dat2$ra)
pr=sde/me/sqrt(length(dat2$ra))
```
The achieved relative precision is `r pr`.



# 2. Calculate Characteristic numbers

## 2. a,b,c) what is a typical value? (2 values), how far is the data typically spreading? (2 values),is the data symmetrically distributed? (2 values)

### mean & median (robust), standard deviation & MAD (robust), skewness & medcouple (robust)

```{r}
summary <- dat2 perc>perc group_by(ma)perc>perc summarise( mean = mean(ra), median = median(ra), std_dev = sd(ra), MAD =mad(ra), skewness=skewness(ra), medcouple= mc(ra))

summary perc>perc mutate_if(is.numeric, format, digits=3,nsmall = 1) perc>perc
  kbl(.,"html",align = "r",caption = "Characteristic Value") perc>perc   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 

```

a) mean and median are nearly equal, i.e. the difference is small compared to the standard deviation / MAD\
b) standard deviation and MAD are nearly equal.\
c) skewness and medcouple are nearly zero.

# 3. Characterise the data further and interpret results
## 3.)a) Generate four plots
### scatter plot
```{r}
ggplot(data=dat2,mapping = aes(x=time,y=ra)) +  geom_point()
```
Distribution looks unsuspicious. There doesnt seem to be any time drift.

### density plot to get an overview of the dataset

```{r}
den1=densityPlot(dat2$ra,main = "data", xlab = "line",ylab = "value")
lines(seq(min(dat2$ra),max(dat2$ra),0.01),dnorm(seq(min(dat2$ra),max(dat2$ra),0.01),mean = mean(dat2$ra),sd=sd(dat2$ra)),col="red",lwd = 2,lty = 'dotted')
```

Data looks normal dsitributed.

### box-notch plot to check for outliers
```{r}
boxplot(dat2$ra,notch = T)
```
there might be one outlier.

### qq-plot to check for normality and outliers
```{r}
ggqqplot(dat2$ra, main = "dat2$ra")
```

Data looks close to normal distributed and no outliers are seen.

## 3.)b) Do two statistical hypothesis tests
### test for normality
Check for normality of dataset with shapiro-wilk test\
H~0~ the dataset is normal distributed.\
set significance level: $\alpha =5\perc$\
```{r}
shapiro.test(dat2$ra)
```
p-value is > previously set alpha value of 0.05, so H~0~ cant be rejected. The dataset seems to be normal distributed.

### check for outliers

H~0~ there are no outliers.\
set significance level: $\alpha =5\perc$\
```{r}
rosnerTest(dat2$ra,k=3)$n.outliers
```

There dont seem to be any outliers.

### alternative: test if distribution is stationary
KPSS test: H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 0.05$
```{r}
kpss.test(dat2$ra)
```
H~0~ cannot to be rejected since ($p>\alpha$), i.e. it seems to be stationary.


# 4.) Write down the essential steps you always have to take for any statistical test / hypothesis testing. 
1. set H~0~ (Null Hypothesis)
2. set significance level $\alpha$
3. choose appropriate statistics
4. analyze data 
   - if necessary test the made assumptions for the test, e.g. test for normal distribution, equal variance
   - run the hypothesis test itself 
5. interpret result mathematically
6. express results in plain language understandable for non-statisticians


# 5.) Next the machine is characterized in the allowed parameter range. Assume that the performance (ra) is linear. Set up a test plan for the characterisation of the machine (ma) 1. (Do 10 replicates for each level.) 

## create test plan for screening with 2 levels for linear regression model with 10 replicates

```{r}
ma=c(1)
vc=c(140,190)
fz=c(0.2,0.4)
ap=c(0.82,3.18)
nr=10
plan3=expand.grid(ma,vc,fz,ap)
plan3=do.call("rbind", replicate(nr, plan3, simplify=F))
names(plan3)<- c("ma","vc","fz","ap") # to names the variables
set.seed(1234) # set seed for random number generator
plan3=plan3[order(sample(1:nrow(plan3))),] # randomize design
```

### Write test plan3 
```{r  warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan3.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan3,file="plan3.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read data 
```{r}
dat3=read.delim("plan3_res.csv",header = T,dec=".", sep = ";")
dat3=transform(dat3,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat3)
```

# 6.) What are four characteristics of a good DOE test plan?

-plan is balanced
-plan is orthogonal
-blocking for countering known nuisance factors
-randomization for conutering unknown nuisance factors
-sufficient replications (if required power is defined)

# 7.) And set up a linear model for the full parameter range (5.). Shortly discuss the result. 

H~01~ vc has no effect on ra \
H~02~ fz has no effect on ra \
H~03~ ap has no effect on ra \
H~04~ vc*fz interaction has no effect on ra\
H~05~ vc*ap interaction has no effect on ra\
H~06~ fz*ap interaction has no effect on ra\
H~07~ vc* fz*ap interaction has no effect on ra\
set significant level: $\alpha = 5\perc$
```{r}
model1=lm(ra~vc*fz*ap,data = dat3)
summary(model1)
```

$p<\alpha$ for H~01~, H~03~, H~04~, H~05~, H~07~ therefore these Hypothesis have to the rejected.\
The rest of the hypothesis cannot be rejected.

## find minimum model that performs just as well as full model and compare models

```{r}
reducedModel<-stepAIC(model1,k=log(nrow(dat3)),direction = "both")
summary(reducedModel)
```
the reduced model removes the interaction vc:fz:ap. Other than that it is the same as the full model

## compare full model with reduced model with anova
H~0~: The reduced model performs as well as the full model\

significance level alpha=0.05\

```{r}
anova(model1,reducedModel)
```

p-value is > previously set alpha value -> the models perform the same.

# 8.) Extra point: Visualize the results of the full model. (2 plots)
## Effect plot
```{r}
MEPlot(model1)
```

The largest effect is by fz.\
It is followed by vc.\
Only a marginal effect is due to ap.\

## Interaction plot
```{r}
IAPlot(model1)
```
There is a small interactions between all factors.\

# 9.) Extra point: Test the three assumptions of the full linear model. (1 plot and 1 test for each assumption) 
## Test the normality of the residuals.

### Do a qq-plot
```{r}
ggqqplot(model1$residuals)
```

Residuals seem to be normal distributed.

### Test normality

H~0~ Data are normal distributed.\
significance level: $\alpha=5\perc$
```{r}
shapiro.test(model1$residuals)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals seem to be normal distributed.\

## Test the homogeneity of the residuals.\
### Do a scatter plot
```{r}
plot(model1$residuals)
```

The residuals look homogeneous.

### do hypothesis test
H~0~ residuals are homogeneous distributed\
significance level: $\alpha=5\perc$

```{r}
ncvTest(model1)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals are homogeneous.\

## Look for leverage points outliers

### Calculate the critical Cooks distance.
```{r}
cd1c=4/length(model1$residuals)
cd1=abs(cooks.distance(model1))
subset(cd1, cd1 > cd1c)
```

There might be some high leverage points.

### do InfluenceIndexPlot

```{r}
influenceIndexPlot(model1, vars=c("Cook", "hat"),id=list(n=3))
```

There might be some high leverage outliers.


# 10.) Extra points: Set up a testing plan to be able to compare the machines 1 and 2 over the whole range. (Do 10 replicates for each level)

## Generate a third test plan for screening both machines. 
```{r}
ma=c(1,2)
vc=c(140,190)
fz=c(0.2,0.4)
ap=c(0.82,3.18)
nr=10
plan4=expand.grid(ma,vc,fz,ap)
plan4=do.call("rbind", replicate(nr, plan4, simplify=F))
names(plan4)<- c("ma","vc","fz","ap") # to names the variables
set.seed(1234) # set seed for random number generator
plan4=plan4[order(sample(1:nrow(plan4))),] # randomize design
```

## Write test plan4 
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan4.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan4,file="plan4.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

# 11.) Extra points: Compare the performance of the two machines

## Read data from plan4 with both machines
```{r}
dat4=read.delim("plan4_res.csv",header = T,dec=".", sep = ";")
dat4=transform(dat4,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat4)
```

## Set up a model to compare two machines.

H~00~ ma has not effect \
H~01~ vc has no effect \
H~02~ fz has no effect \
H~03~ ap has no effect \
H~04~ vc*fz interaction has no effect\
H~05~ vc*ap interaction has no effect\
H~06~ pc*ap interaction has no effect\
H~07~ vc* fz*ap interaction has no effect\
set significant level: $\alpha = 5\perc$

```{r}
model2=lm(ra~ma+vc*fz*ap,data = dat4)
summary(model2)
```

$p>\alpha$ for H~00~, H~01~, H~05~, H~06~, H~07~ therefore these Hypotheses cannot be rejected.\
The rest of the hypothesis have to be rejected.\
Thus the two machines have a same performance.

# 12.) Extra points: Calculate the number of replications that would be needed to resolve the smallest main effect still with a 95perc certainty. (You should take data only from one machine.) 

```{r}
# take the smallest effect as a reference.
deltas = (mean(filter(dat3, ma==1 & vc == 140)$ra) -  mean(filter(dat3, ma==1 & vc == 190)$ra)) / sd(filter(dat3, ma==1)$ra) 

sig=0.05
nff=size.anova("axbxc",a=2,b=2,c=2,n=NULL,alpha = 0.05,beta = 0.05,d=deltas,cases = "maximin")
```

One would need `r nff` experiments.






}

}
\keyword{ anova }

