\name{size.anova7}
\alias{size.anova7}
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








#########7##

You have two machines (ma) that have two control parameters (turning speed (ts), feederate (fr))
and you are interested in the roughness (ra) of your parts. The turning speed can be varied between
100 to 8000 rpm and feedrate from 0.001 to 0.01 mm/U, but you are only interested in the range: ts
4000 to 6000 rpm and fr 0.001 to 0.003 mm/U.


# 7.1
Characterize the first machine (1) to get a first impression on the machine performance. To get
the data set up a testing plan to do the screening (Write the plan to a csv file that has your
Matrikelnummer prior to the plan, followed by the variable names and then the levels of your
plan. The plan should have 3 columns (ma,ts,fr)). And then determine the corresponding linear
model and check, if it might be reduced.


# 7.2
Determine the number of experiments, if you want to right with your model to 99proz. And write a
second plan to compare the two machines. (Write the plan to a csv file that has your
Matrikelnummer prior to the plan, followed by the variable names and then the levels of your
plan. The plan should have 3 columns (ma,ts,fr)). And then analyse the result with an appropriate
model and check all the assumption















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






#7.1
## Generate Screening Plan machine 1

### generate plan
```{r}
ma=c(1)                                                   # machines tested
ts=c(4000,6000)                                           # turning speeds tested
fr=c(0.001,0.003)                                         # feed rates tested
nr=3                                                    # number of replicates
plan1=expand.grid(ma,ts,fr)                               # generate a base plan                          
plan1=do.call("rbind", replicate(nr, plan1, simplify=F))  # replicate the base plan
names(plan1)<- c("ma","ts","fr")                          # to names the variables
set.seed(1234)                                            # set seed for random number generator
plan1=plan1[order(sample(1:nrow(plan1))),]                # randomize design
plan1
```

### write plan
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### read data
```{r}
dat1=read.delim("plan1_res.csv",header = T,dec=".", sep = ";")
dat1=transform(dat1,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat1)
```


Check class of variables
```{r}
map_df(dat1, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```
check if there is an NA for any machine
```{r}
dat1 proz>proz group_by(ma) proz>proz summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

### Have first glance at the data
#### Scatter Plot
```{r fig.height=9}
dat1 proz>proz ggplot(data=.,mapping = aes(x=time,y=ra)) +  geom_point() + ggtitle("Scatterplot for Machine")
```
The data show no suspicious elements in the scatterplot. There doesnt't seem to be any obvious drift.

#### statistical tests before comparison of machines
-test for normality: shapiro-wilk-test -> H~0~: distribution is normal distributed\
-testing if stationary: KSPP test -> H~0~: distribution is stationary\
-testing for outliers: Rosner test -> H~0~: there are no outliers in the distribution\
-testing necessary power for Box Cox transformation to normal distribution -> powerTransform

the significance level for all tests is set to alpha=5proz\

```{r warning=F}
summary_val <- dat1 proz>proz group_by(ma)proz>proz summarise( shapiro_p = shapiro.test(ra)$p.value, kspp_p=kpss.test(ra)$p.value,n_outlier=rosnerTest(ra, k = 3, alpha = 0.05, warn = F)$n.outliers,Box_Cox_lamda=powerTransform(ra, family="bcPower")$lambda)
summary_val proz>proz mutate_if(is.numeric, format, digits=3,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "Statistical Test Results") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```
H~0~ cannot be rejected because ($p>\alpha$ ).\

for machine 1 H~0~ for normal distribution is rejected as p<alpha. They don't seem to be normal distributed.\
all distributions seem to stationary as p-value of KSPP is above alpha.\
there don't seem to be any outliers
the power for Box-Cox-Transformation is close to -0.5 for machines 1, distribution should be transformed to be closer to normal distribution.\

```{r , message=F, warning=F}
my_fn <- function(data, mapping, ...){
  p <- ggplot(data = data, mapping = mapping) + 
    geom_point() + 
    geom_smooth(method=lm, fill="blue", color="blue", ...)
  p
}
dat1proz>proz ggpairs(., lower = list(continuous = my_fn))
```

```{r warning=F, error=F}
scatterplotMatrix(~time+ts+fr+ra|ma, data=dat1 , #without machine, as machine has only one value (1)
      reg.line="" , smoother="")
```


## Set up first model
H~01~: Parameter time has no effect.\
H~02~: Parameter fr has no effect.\
H~03~: Parameter ts has no effect.\
H~04~: There is no interaction between fr and ts.\
Set significance level. $\alpha=5\proz$
```{r}
mod1=  lm(ra~time+ts*fr,data = dat1) #interactions with time are not important as there is no time drift
summary(mod1)
```
Only for ts:fr the p-value is below $\alpha$. Only H~04~ has to be rejected. -> the interaction ts:fr seems to have an effect. \

Do a simplified model without time:
H~01~: Parameter fr has no effect.\
H~02~: Parameter ts has no effect.\
H~03~: There is no interaction between fr and ts.\
Set significance level. $\alpha=5\proz$

```{r}
mod1a= dat1 proz>proz lm(ra~ts*fr,data = .)
summary(mod1a)
```
Only for ts:fr the p-value is close to $\alpha$ but still above alpha. -> No Null-Hypothesis can be rejected. \

H~0~: Both models are equally fine.\
Set significance level. $\alpha=5\proz$
```{r}
anova(mod1,mod1a)
```
Since $p>\alpha \therefore H_0$ cannot be rejected.\
Both models seem to be equally fine.

Do a simplified model without interaction ts:fr:
H~01~: Parameter fr has no effect.\
H~02~: Parameter ts has no effect.\
Set significance level. $\alpha=5\proz$

```{r}
mod1b= dat1 proz>proz lm(ra~ts+fr,data = .)
summary(mod1b)
```
both fr and ts have a p-value below $\alpha$. H~01~ and H~02~ have to be rejected. \

H~0~: Both models are equally fine.\
Set significance level. $\alpha=5\proz$
```{r}
anova(mod1,mod1b)
```
Since $p>\alpha \therefore H_0$ cannot be rejected.\
Both models seem to be equally fine.\

Find the best model using the BIC.\
```{r}
step1<-stepAIC(mod1,k=log(nrow(dat1)),direction = "both",trace = 0)
step1$anova
```
The BIC reaches the same best model.













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





# 7.2
Determine the number of experiments, if you want to right with your model to 99proz. And write a
second plan to compare the two machines. (Write the plan to a csv file that has your
Matrikelnummer prior to the plan, followed by the variable names and then the levels of your
plan. The plan should have 3 columns (ma,ts,fr)). And then analyse the result with an appropriate
model and check all the assumptions

## Do a power analysis 

Estimate the number of experiments per level to be correct by 99proz (p=0.99) with lm.

```{r}
r2=summary(mod1)$r.squared
f=r2/(1-r2)
uf=4 # number of continuous predictors + number of dummy variables - 1; number of factors and interactions in model
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n2=ceiling(p_res$v+uf+1)
```

```{r}
r2=summary(mod1a)$r.squared
f=r2/(1-r2)
uf=3 # number of continuous predictors + number of dummy variables - 1; number of factors and interactions in model
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n2a=ceiling(p_res$v+uf+1)
```

```{r}
r2=summary(mod1b)$r.squared
f=r2/(1-r2)
uf=2 # number of continuous predictors + number of dummy variables - 1; number of factors and interactions in model
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n2b=ceiling(p_res$v+uf+1)
```

For the number of experiment/number of samples to be done derived from the first model `r n2`, from the second model `r n2a` and from the smallest model `r n2b`.



## generate a verification plan
```{r}
ma=c(1,2)                                                 # machines tested
ts=c(4000,6000)                                           # turning speeds tested
fr=c(0.001,0.003)                                         # feed rates tested
nr=ceiling(n2/2)                                          # number of replicates (since 2 levels divide n2 by 2)
plan2=expand.grid(ma,ts,fr)                               # generate a base plan                          
plan2=do.call("rbind", replicate(nr, plan2, simplify=F))  # replicate the base plan
names(plan2)<- c("ma","ts","fr")                          # to names the variables
set.seed(1234)                                            # set seed for random number generator
plan2=plan2[order(sample(1:nrow(plan2))),]                # randomize design
```

Write test plan
```{r warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan2,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

Read data
```{r}
dat2=read.delim("plan2_res.csv",header = T,dec=".", sep = ";")
dat2=transform(dat2,ma=as.factor(ma)) # transform the machine number from a numerical to a factor!
head(dat2)
```

Check class of variables
```{r}
map_df(dat1, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```
Data types are set ok.

check if there is an NA for any machine
```{r}
dat2 proz>proz group_by(ma) proz>proz summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

there are no NA

## Have first glance at the data

### Scatter Plot
```{r fig.height=9}
dat2 proz>proz ggplot(data=.,mapping = aes(x=time,y=ra)) +  geom_point() + ggtitle("Scatterplot for Machine")
```

The data show no suspicious elements in the scatterplot. There doesn't seem to be any time drift.

H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$

```{r warning=F}
summary_kpss <- dat2 proz>proz group_by(ma)proz>proz summarise(kpss_p=kpss.test(ra)$p.value)

summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```

H~0~ cannot be rejected because ($p>\alpha$ ).\
Data are stationary.

## Check Effects
```{r , message=F, warning=F}
dat2 proz>proz ggpairs(., lower = list(continuous = my_fn), title ="all data")
dat2 proz>proz filter(ma==1) proz>proz ggpairs(., lower = list(continuous = my_fn), title ="machine 1")
dat2 proz>proz filter(ma==2) proz>proz ggpairs(., lower = list(continuous = my_fn), title ="machine 2")
```
Data look unsuspicious.


## find reduced model
Set up a model for the two machines.\
H~01~: Parameter time has no effect.\
H~02~: Machines have no effect.\
H~03~: Parameter fr has no effect.\
H~04~: Parameter ts has no effect.\
H~05~: There is no interaction between fr and ts.\
Set significance level. $\alpha=5\proz$
```{r}
mod2=lm(ra~time+ma+ts*fr,dat2) # Only ts and fr are parameters for control of ra -> interactions of time and ra are not of interest as there ist no time drift
summary(mod2)
```
Both factors and the machines seems to have an effect. However, the time seems to play no role, i.e. no drift.
All Null-Hypoth. are rejected except H~01~.


Set up a reduced model.
H~01~: Machines have no effect.\
H~02~: Parameter fr has no effect.\
H~03~: Parameter ts has no effect.\
H~04~: There is no interaction between fr and ts.\
Set significance level. $\alpha=5\proz$
```{r}
mod2a=lm(ra~ma+ts*fr,dat2)
summary(mod2a)
```
All $p<\alpha \therefore H_0$ has to be rejected for all Null hypothesis.\
All factors and interaction ts:fr seem to have an effect.

## Compare the models
H~0~ Models are equally good\
significance level $\alpha$=0.05\
```{r}
anova(mod2,mod2a)
```
p>$\alpha$ $\Rightarrow$ H~0~ cannot be rejected.\
The most appropriate model is including the factors and the interaction ts:fr.


Find the best model using the BIC.\
```{r}
step2<-stepAIC(mod2,k=log(nrow(dat2)),direction = "both")
```
The BIC reaches the same best model.\

Check, if the power is appropriate chosen to reach at least a power of p=0.99.\
```{r}
r2=summary(mod2a)$r.squared
f=r2/(1-r2)
sig=0.01
pwr.f2.test(u=4,v=nrow(dat2)/8,f2=f,sig.level=sig,power=NULL)
```
The division by 2^3=8 is done to account for the three dimensionality (two levels, three factors -> ma, ts, fr) of the model.\
The power seems to be correct.\
To be sure we rerun the analysis from before.\
```{r}
r2=summary(mod2)$r.squared
f=r2/(1-r2)
uf=5
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n22=ceiling(p_res$v+uf+1)
```

```{r}
r2=summary(mod2a)$r.squared
f=r2/(1-r2)
uf=4
sig=0.01
p=0.99
p_res=pwr.f2.test(u=uf,v=NULL,f2=f,sig.level=sig,power=p)
n22a=ceiling(p_res$v+uf+1)
```
The rerun of the power analysis suggests running one experiment more (`r n22` and `r n22a`).

## Visualize results
```{r}
MEPlot(mod2a)
```
The highest effect is by the feedrate, followed by the turning speed and also the machines seem to have an main effect on ra.
```{r}
IAPlot(mod2a)
```
There is a slight interaction between turning rate and feed rate.


## Test the assumptions of the model
### Test the normality of the residuals.
#### Do a qq-plot
```{r}
ggqqplot(mod2a$residuals)
```
Residuals seem to be nearly normal distributed, but there are some deviations.

#### Do a Shapiro Wilk Test on the residuals
>H~0~ Residuals are normal distributed.\
significance level: $\alpha=5\proz$\

```{r}
shapiro.test(mod2a$residuals)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals seem to be normal distributed.\

### Test the homogeneity of the residuals\
#### spread-level plot
```{r warning=F}
spreadLevelPlot(mod2a)
```
The residuals look homogeneous.

#### ncvTest to test homogenous distr. of residuals
H~0~ residuals are homogeneous distributed\
significance level: $\alpha=5\proz$

```{r}
ncvTest(mod2a)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals seem to be homogeneous.\


### Look for leverage points outliers
#### Calculate the critical Cooks distance.
```{r}
cd1c=4*2/length(mod2a$residuals)
cd1=abs(cooks.distance(mod2a))
subset(cd1, cd1 > cd1c)
```
There might be four high leverage points.

#### do InfluenceIndexPlot
```{r warning=F}
influenceIndexPlot(mod2a, vars=c("Cook", "hat"),id=list(n=3))
```
There might be one high leverage outlier at Index 23.

### Check for autocorrelation
#### acf plot for auto correlation
```{r}
acf(mod2a$residuals)
```
There seems to be low auto correlation in the residuals.

#### Durbin Watson Test for autocorrelation
H~0~ residuals are not autocorrelated\
significance level: $\alpha=5\proz$
```{r}
durbinWatsonTest(mod2a)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals show no auto correlation.\


### Test for Multicollinearity
#### Do a generalized pairs plot to spot correletations
```{r , message=F, warning=F}
ggpairs(mod2a)
```
no correlation between the variables ts, fr and ma is seen.

####  do a Multicollinearity test
H~0~ Data are not multi collinar\
```{r}
vif(mod2a)
```
not all values are below 4, i.e. there might be a problem (vif values below 10 are acceptable, vif values below 4 are ideal, vif>10 inidcates multicollin.).

```{r}
library(performance)
check_collinearity(mod2a)
```

using another package however gets fine results.

```{r}
library(mctest)
omcdiag(mod2a)
imcdiag(mod2a)
```

















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

