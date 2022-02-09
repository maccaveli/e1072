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














##########9##
You found a new chemical that precipitated at the end of the reaction. For the next reaction you
have to dissolve it. You decide to use mixtures of three different organic chemicals: Butanone,
Toluene, and Hexane. To figure which is best you always work with 100 µl solvent volume in which
you try to dissolve as much as possible. After thorough mixing you centrifuge down the undissolved
chemical, remove the solvent and evaporate the solvent in a small dish with known weight. After all
this you weight the amount of the new chemical that was dissolved. 

## 9.1 Set up an experimental design to determine the best mixture. Write the plan to a csv file that has your Matrikelnummer prior to the plan.
## 9.2 Analyse the results. Set up a model and if necessary set up another plan for generating new data. (Iterate the process until you are satisfied with your result/optimization.














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





## 9.1 Set up an experimental design to determine the best mixture. Write the plan to a csv file that has your Matrikelnummer prior to the plan.
### Generate a mixture plan with 3 factors and five levels (optimization)
```{r}
nf<-3     # number of factors
nl<-4     # number of levels - 1
plan1 = SLD(nf,nl)# simplex lattice designs
names(plan1)<-c("Butanon","Toluol","Hexan")
# des <- SCD(3)
plan1 = plan1[order(sample(1:nrow(plan1))),]     # randomize               
DesignPoints(plan1)
```

### Write test plan to file
```{r echo=T, message=F, warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```
## 9.2 Analyse the results. Set up a model and if necessary set up another plan for generating new data. (Iterate the process until you are satisfied with your result/optimization.)
### Read "Measured" data
```{r}
dat1 = read.delim("plan1_res.csv", header = T,sep = ";", dec = ".")
head(dat1)```

### Have first glance at the data
#### Check class of variables
```{r}
map_df(dat1, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```
all columns are numeric as there is no categorical data e.g. machines.

#### check if there are NA values
```{r}
dat1 proz>proz  summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```
#### Scatter Plot
```{r fig.height=9}
dat1 proz>proz ggplot(data=.,mapping = aes(x=time,y=measured)) +  geom_point() + ggtitle("Scatterplot")
```
The data show no suspicious elements in the scatterplot. There might be slight drift over time.

H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$
```{r warning=F}
summary_kpss <- dat1 proz>proz  summarise(kpss_p=kpss.test(measured)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```

H~0~ cannot be rejected because ($p>\alpha$ ).\
dataset seems to be stationary.
Eliminate time as variable since the reduced model does not require the time and no time drift was seen in previous analysis
```{r}
dat1<-dat1[-1]
```
### Analyse data
#### first try a linear model
model without intercept up to three-fold interaction
```{r}
model1=lm(measured~-1+Butanon+Toluol+Hexan+Butanon:Toluol+Butanon:Hexan+Toluol:Hexan+Butanon:Toluol:Hexan,dat1)
summary(model1)
```
alternative three-fold interaction linear model without intercept:
```{r}
model1=lm(measured~-1+Butanon*Toluol*Hexan,dat1)
summary(model1)
```

#### correlation matrix
```{r warning=F, message=F}
my_fn <- function(data, mapping, ...){
  p <- ggplot(data = data, mapping = mapping) + 
    geom_point() + 
    geom_smooth(method=loess, fill="red", color="red", ...) +
    geom_smooth(method=lm, fill="blue", color="blue", ...)
  p
}
dat1proz>proz ggpairs(., lower = list(continuous = my_fn))
```
There seems to be some correlation between the measured values and Butanon also between measured values and Toluol.
But there seems to be hardly any correlation between Hexan and the measured value.

#### alternative to lm without intercept (same resulting model): create a special cubic mixing model (three-fold ia)
```{r}
# model: 1=linear, 2=quadratic, 3=cubic, 4=special cubic, ...
model2=MixModel(frame = dat1,response = "measured",mixcomps=c("Butanon","Toluol","Hexan"),model=4)
summary(model1)```

#### create a reduced mixing model (quadratic, only two-fold ia)
```{r}
model3=MixModel(frame = dat1,response = "measured",mixcomps=c("Butanon","Toluol","Hexan"),model=2)
summary(model3)
```
adjusted R-squared of reduced quadratic model `r summary(model3)$adj.r.squared` is slightly higher than cubic model `r summary(model2)$adj.r.squared`.
So three-fold interaction doesn't seem to be of importance.

To analyze Effects of factors, we create a reduced linear model with only two-fold-interactions.
```{r}
model1a=lm(measured~-1+Butanon+Toluol+Hexan+Butanon:Toluol+Butanon:Hexan+Toluol:Hexan,dat1)
summary(model1a)
```
alternative lm with two-fold interactions:
```{r}
model1a=lm(measured~-1+Butanon*Toluol+Butanon*Hexan+Toluol*Hexan,dat1)
summary(model1a)
```

Effect of the different factors and interactions according to lm model with two-fold-ia
```{r}
library(pid)
paretoPlot(model1a, xlab="Effect name", ylab="Magnitude of effect")
```
The interactions seem to have the biggest effect on the measured value. The measured value only seems to have a slight dependence on the single factor values.
#### Check model assumptions
##### Test the normality of the residuals.
###### Do a qq-plot
```{r}
ggqqplot(model1a$residuals)
```
Residuals seem to be nearly normal distributed, but there are some deviations.

###### Do a Shaprio Wilk Test
H~0~ Data are normal distributed.\
significance level: $\alpha=5\proz$\

```{r}
shapiro.test(model1a$residuals)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Thus the residuals seem to be normal distributed.\

##### Test the homogenity of the residuals\
###### spread-level plot
```{r warning=F}
spreadLevelPlot(model1a)
```
The residuals look like they might not be homogeneous. There might be one large value.

###### do hypothesis test
H~0~ residuals are homogeneous distributed\
significance level: $\alpha=5\proz$

```{r}
ncvTest(model1a)
```
$p>\alpha \therefore H_0$ can't be rejected.\
Thus the residuals seem to be homogeneous.\

##### analyze for high leverage outliers
###### Calculate the critical cooks distance
```{r}
cd1c=4*2/length(model1a$residuals) #corrected by dimension of model (quadratic=2)
cd1=abs(cooks.distance(model1a))
subset(cd1, cd1 > cd1c)
```
There doesn't seem to be a high leverage outlier.

##### do InfluenceIndexPlot
```{r warning=F}
influenceIndexPlot(model1a, vars=c("Cook", "hat"),id=list(n=3))
```

There might be a high leverage point at Index 12.

#### Check for autocorrelation
##### Do an auto correlation plot
```{r}
acf(model1a$residuals)
```
looks like there might be slight auto correlation in the residuals.

##### do a Durbin Watson Test
H~0~ residuals are not autocorrelated\
significance level: $\alpha=5\proz$
```{r}
durbinWatsonTest(model1a)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
But the p-value is very close to $\alpha\proz$
Thus the residuals show no auto correlation but it might need to be reinvestigated.\

#### Testing for Multicollinearity
##### generalized pairs plot to spot correlations
```{r , message=F, fig.width=15}
ggpairs(model1a)
```
no correlation between the variables is seen.

#####  do a Multicollinearity test
H~0~ Data are not multi collinar\
```{r}
vif(model1a)
```
all values are below 4, so there doesn't seem to be multicollinearity of any factor.

```{r}
library(performance)
check_collinearity(model1a)
library(mctest)
omcdiag(model1a)
```

#### Plot results
```{r, fig.width=12}
x1<-"Butanon"
x2<-"Toluol"
x3<-"Hexan"
ModelPlot(model = model1a,dimensions = list(x1 = x1, x2 = x2, x3 = x3),main = "Product", lims = c(0, 1, 0, 1, 0, 1),constraints = TRUE, contour = TRUE, cuts = 6, fill = TRUE,cornerlabs = c(x1, x2, x3), axislabs = c(paste("Fraction ", x1), paste("Fraction ", x2), paste("Fraction ", x3)))
```

### Generate a second plan with higher resolution (more levels) and 10 replications for more detailed optimization.
```{r}
nr=10                         # number of replications
plant=SLD(3, 5)               # Generate simplex lattice design with 5 levels
# one could add more points with Fillv()
plan2=do.call("rbind", replicate(nr, plant, simplify = FALSE))
plan2 = plan2[order(sample(1:nrow(plan2))),]                   # randomize               
names(plan2)<-c("Butanon","Toluol","Hexan")
DesignPoints(plan2)
```

### Write detailed test plan to file
```{r echo=F, message=F, warning=F}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the Testplan
write.table(plan2,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read "Measured" data
```{r}
dat2 = read.delim("plan2_res.csv", header = T,sep = ";", dec = ".")
head(dat2)
```

#### first glance at the data of second more detailed plan
##### Check class of variables
```{r}
map_df(dat2, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```

##### check if there is are NA values
```{r}
dat2 proz>proz  summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

##### Scatter Plot
```{r fig.height=9}
dat2 proz>proz ggplot(data=.,mapping = aes(x=time,y=measured)) +  geom_point() + ggtitle("Scatterplot")
```
The data show no suspicious elements in the scatterplot. Visually there doesn't seem to be any time drift.

##### KPSS-Test
H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$
```{r warning=F}
summary_kpss <- dat2 proz>proz  summarise(kpss_p=kpss.test(measured)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```

H~0~ cannot be rejected ($p>\alpha$ ).\
There doesn't seem to be any drift allthough kpss p-value of more detailed model is closer to $\alpha\proz$
Time can be eliminated from model.

#### Create linear model with max. two-fold-ias.
```{r}
model2=lm(measured~-1+Butanon+Toluol+Hexan+Butanon:Toluol+Butanon:Hexan+Toluol:Hexan,dat2)
summary(model2)
```
With more detailed test plan, all factors and interactions seem to matter.
Check with the BIC, if all factors are needed in a reduced model or if some factors can be removed.
```{r}
stepAIC(model2,k=log(nrow(dat2)),direction = "both",trace = 0)
```
BIC results in the same model as model2.

#### Try to remove interaction with least effect (Butanon:Toluol) and check if models perform the same
```{r}
model2b=lm(measured~-1+Butanon+Toluol+Hexan+Butanon:Hexan+Toluol:Hexan,dat2)
summary(model2b)
```
adjusted r.squared of model was reduced slightly by removing interaction Butanon:Toluol.

#### Check if models perform the same
H~0~ models are equally fine.
significance level  $\alpha=0.05$\
```{r}
anova(model2,model2b)
```
$\because p<\alpha \Rightarrow$, I must reject H~0~.\
The models are not equally fine -> Keep interaction Butanon:Toluol -> Final model is model2.

#### Plot results and find optimum
```{r, fig.width=12}
x1<-"Butanon"
x2<-"Toluol"
x3<-"Hexan"
ModelPlot(model = model2,dimensions = list(x1 = x1, x2 = x2, x3 = x3),main = "Product", lims = c(0, 1, 0, 1, 0, 1),constraints = TRUE, contour = TRUE, cuts = 6, fill = TRUE,cornerlabs = c(x1, x2, x3), axislabs = c(paste("Fraction ", x1), paste("Fraction ", x2), paste("Fraction ", x3)))
```
Optimum/maximum seems to have shifted slightly compared to first analysis with reduced test plan.\

##### create rsm model for finding stationary point/optimum
leave out one factor (hexan) as the mixing design is able to calculate value of third factor from values of other two factors\
```{r}
model3=rsm(measured~FO(Butanon,Toluol)+TWI(Butanon,Toluol)+SO(Butanon,Toluol)+PQ(Butanon,Toluol),dat2) #FO=first order, TWI=Two-way-interaction, SO=Second order, PQ=Pure Quadratic
summary(model3)
```
leave out other factor (Toluol) as the mixing design is able to calculate value of third factor from values of other two factors\
to retrieve value at optimum/stationary point for hexan.

```{r}
model3a=rsm(measured~FO(Butanon,Hexan)+TWI(Butanon,Hexan)+SO(Butanon,Hexan)+PQ(Butanon,Hexan),dat2)
summary(model3a)
```
###### Predict value of optimum.
```{r}
sp1=as.data.frame(t(as.matrix(summary(model3)$canonical$x)))
maxp=predict(model3,newdata=sp1)
maxp
```
The predicted maximum/optimum is `r maxp` at the following combination of factor values / stationary point:

```{r}
# combination of factor values for optimum
sp2 = as.data.frame(t(as.matrix(summary(model3a)$canonical$x)))
sp<-cbind(sp1,sp2[-1])
sp
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


















###########10#
Your task is to optimize a minimum quantity lubrication (MQL) process on a turning machine with\
respect to the roughness (ra). You have four factors that you want to take into account: cutting\
speed (c), feed rate (f), depth of cut (d) and the nozzle diameter for the MQL.\
The current operation parameters are c=200 m/min, f= 0.15 mm/rev, d=0.8 mm, n = 4 mm\

```{r, echo=FALSE}
tabl <- " 
|        Parameter        | min. val.| max. val.|
|-------------------------|:--------:|:--------:|
| Cutting speed: c (m/min)|    50    |    450   |
| Feed rate: f (mm/rev)   |   0.01   |    0.29  |
| Depth of cut: d (mm)    |    0.1   |    1.7   |
| Nozzle diameter: n (mm) |     2    |    6     |
"
cat(tabl) # output the table in a format good for HTML/PDF/docx conversion
```
You will be asked to write down several plans in the following. These plans have all the same\
structure. The file starts with the Matrikelnumber. This row is followed by a row with the column\
names: c, f, d, n. In the next rows follows the plan with its levels. There are always 4 columns.\


## 10.1 - Screening Model without interactions 
Set up a first screening plan around the current parameter, to get an estimate about the machine\
performance. For this choose a resolution that assumes that there are no interactions and take\
the level range to be below 30proz of the full range. (Because you know that nonlinear behaviour\
could occur.) And evaluate the results of the screening with an appropriate model. (Do not\
validate model assumptions.)\

## 10.2 - Screening Model with two-fold-interactions  
After having this first overview set up a second plan with an appropriate resolution, (which?),
that considers also two, fold interactions. (But, is still linear.) And evaluate the results of the
screening with an appropriate model. (1 Model, 3 Plots) (Do not validate model assumptions.)

## 10.3 - Now set of a sequence of plans and try to find the optimum performance (smallest Ra).













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





## 10.1 - Screening Model without interactions 
Set up a first screening plan around the current parameter, to get an estimate about the machine\
performance. For this choose a resolution that assumes that there are no interactions and take\
the level range to be below 30proz of the full range. (Because you know that nonlinear behaviour\
could occur.) And evaluate the results of the screening with an appropriate model. (Do not\
validate model assumptions.)\

### decide necessary number of experiments
resolution=3 as interactions are not of importance
```{r warning=F, message=F, error = T}
nex=nrow(FrF2(resolution = 3, nfactors=4,clear=TRUE, res3=TRUE))
nex
```
The number of experiments is `r nex`.

### Generate test plan
Generate a fractional factorial plan.
set factors for screening so that level range is below 30proz of the full range -> min. level= 0.8*current optimum, max.level=1.2*current optimum
```{r warning=F, message=F, error = T}
nr=1            # number of replications
plan1=FrF2(nruns=nex,nfactors=4,replication=nr,factor.names=list(c=c(200*.8,200*1.2),f=c(0.15*.8,0.15*1.2),d=c(0.8*.8,0.8*1.2),n=c(0.8*4,1.2*4)),randomize = T)
plan1
```
Show the aliasing
```{r}
aliasprint(plan1)
```
two-fold interactions are confounded as expected.

### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan1,file="plan1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
dat1 = read.delim("plan1_res.csv", header = TRUE,sep = ";", dec = ".")
head(dat1)
```

#### first glance at the data
##### Check class of variables
```{r}
map_df(dat1, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```

##### check for NA values
```{r}
dat1 proz>proz  summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

##### Scatter Plot
```{r fig.height=9}
dat1 proz>proz ggplot(data=.,mapping = aes(x=time,y=ra)) +  geom_point() + ggtitle("Scatterplot")
```
The data show no suspicious elements in the scatterplot. There might be time drift.

H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$
```{r warning=F}
summary_kpss <- dat1 proz>proz  summarise(kpss_p=kpss.test(ra)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```

H~0~ cannot be rejected because ($p>\alpha$ ).\
Data seem to be stationary.
Eliminate time as variable since no time drift was seen in KPSS-Test, so the reduced model does not require the time.
```{r}
dat1<-dat1[-1]
```
##### Visualize data
```{r message=F}
ggpairs(dat1,lower = list(continuous = wrap("smooth", alpha = 0.3, size=0.1)))
```
ra seems to have the most relevant correlation with c followed by f. The factors don't seem to correlate with each other.

### Set up a linear model for screening
H~01~: c has no effect\
H~02~: f has no effect\
H~03~: d has no effect\
H~04~: n has no effect\
significance level  $\alpha=0.05$\

```{r warning=F, message=F, error = T}
mod1=lm(ra~.,data=dat1) # linear model
summary(mod1)
```
c and f seem to be significant.\

check if a reduced model is appropriate with BIC.
```{r}
modBIC1<-stepAIC(mod1,k=log(nrow(dat1)),direction = "both",trace = 0)
summary(modBIC1)
```
BIC removes factor n, as it doesn't seem to be significant for the model.

#### check if factor d is significant, or the model can be reduced further
H~01~: c has no effect\
H~02~: f has no effect\
significance level  $\alpha=0.05$\

```{r warning=F, message=F, error = T}
mod1r=lm(ra~c+f,data=dat1) # linear model
summary(mod1r)
```
$p<\alpha$ of H~01~ and H~02~ cannot be rejected.\

##### compare models with anova
H~0~ models are equally fine.
significance level  $\alpha=0.05$\
```{r warning=F, message=F, error = T}
anova(modBIC1,mod1r)
```
$\because p<\alpha \Rightarrow$, I can't reject H~0~.\
The models seem to be equally fine. But we keep model with factor d, as adj.r.squared is higher than reduced model -> final model for first screening is modBIC1.

#### visualize effects
```{r warning=F, message=F, error = T}
MEPlot(mod1)
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




## 10.2 - Screening Model with two-fold-interactions  
After having this first overview set up a second plan with an appropriate resolution, (which?),
that considers also two, fold interactions. (But, is still linear.) And evaluate the results of the
screening with an appropriate model. (1 Model, 3 Plots) (Do not validate model assumptions.)

### determine necessary number of experiments for model with two-fold-interaction but linear model (2 levels suffice)
```{r warning=F, message=F, error = T}
nex2=nrow(FrF2(resolution = 5, nfactors=4,clear=TRUE, res3=TRUE))
nex2
```
The number of experiments is `r nex2`.

### Generate Plan
Generate a fractional factorial plan.
```{r warning=F, message=F, error = T}
nr=1            # number of replications
plan2=FrF2(nruns=nex2,nfactors=4,replication=nr,factor.names=list(c=c(200*.8,200*1.2),f=c(0.15*.8,0.15*1.2),d=c(0.8*.8,0.8*1.2),n=c(0.8*4,1.2*4)),randomize = T)
```

Show the aliasing
```{r}
aliasprint(plan2)
plan2=as.data.frame(plan2) 
plan2=plan2[-5] # there is a last block column that has to be eliminated
plan2
```
There doesn't seem to be any aliasing.

### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan2,file="plan2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
dat2 = read.delim("plan2_res.csv", header = TRUE,sep = ";", dec = ".")
datatable(dat2)
```

#### first glance at the data
##### Check class of variables
```{r}
map_df(dat2, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```

##### check if there are NA values
```{r}
dat2 proz>proz  summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```

##### Scatter Plot
```{r fig.height=9}
dat2 proz>proz ggplot(data=.,mapping = aes(x=time,y=ra)) +  geom_point() + ggtitle("Scatterplot")
```
The data show no suspicious elements in the scatterplot. There might be slight time drift.

##### KPSs-Test
H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$

```{r warning=F}
summary_kpss <- dat2 proz>proz  summarise(kpss_p=kpss.test(ra)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```
H~0~ cannot be rejected because ($p>\alpha$ ).\
Data seems to be stationary.

Eliminate time as variable since no time drift was seen initially, so the reduced model does not require the time
```{r}
dat2<-dat2[-1]
```

##### Visualize data
```{r message=F}
ggpairs(dat2,lower = list(continuous = wrap("smooth", alpha = 0.3, size=0.1)))
```
c seems to be relevant, f seems relevant but less so. d and n could be irrelevant.

### Set up a linear model
H~01~: c has no effect\
H~02~: f has no effect\
H~03~: d has no effect\
H~04~: n has no effect\
H~05~: cf has no effect\
H~06~: cd has no effect\
H~07~: cn has no effect\
H~08~: fd has no effect\
H~09~: fn has no effect\
H~010~: dn has no effect\
significance level  $\alpha=0.05$\

```{r warning=F, message=F, error = T}
mod2=lm(ra~.^2,data=dat2) # linear model
summary(mod2)
```
c, f, and interaction c:d seem to be most significant. But all p-values are > alpha -> all initial null-hypothesis can't be rejected.

#### visualize main effects
```{r warning=F, message=F, error = T}
MEPlot(mod2)
```
c and f seem to be most significant.

#### visualize interactions
```{r warning=F, message=F, error = T}
IAPlot(mod2)
```
all factors seem to have at least slight interactions, except interaction f:n.

#### pareto plot
```{r}
library(pid)
paretoPlot(mod2, xlab="Effect name", ylab="Magnitude of effect")
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




## 10.3 - Now set of a sequence of plans and try to find the optimum performance (smallest Ra).
Generate fractional factorial plan with more replications for optimization
```{r warning=F, message=F, error = T}
nr=3            # number of replications
plan2a=FrF2(nruns=nex2,nfactors=4,replication=nr,factor.names=list(c=c(200*.8,200*1.2),f=c(0.15*.8,0.15*1.2),d=c(0.8*.8,0.8*1.2),n=c(0.8*4,1.2*5)),randomize = T)
```
Show the aliasing
```{r}
aliasprint(plan2a)
plan2a=as.data.frame(plan2a)
plan2a=plan2a[-5]  # there is a last block column that has to be eliminated
```
There doesn't seem to be any aliasing.

### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plan2a.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan2a,file="plan2a.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```
### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
dat2a = read.delim("plan2a_res.csv", header = TRUE,sep = ";", dec = ".")
head(dat2)
```
#### Have first glance the data
##### Check class of variables
```{r}
map_df(dat2a, class) proz>proz kbl(.,"html") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive"))
```
##### check if there is an NA for any machine
```{r}
dat2a proz>proz  summarise("number of NA"= sum(is.na(.)))proz>proz datatable(.,class = 'cell-border stripe')
```
##### Scatter Plot
```{r fig.height=9}
dat2a proz>proz ggplot(data=.,mapping = aes(x=time,y=ra)) +  geom_point() + ggtitle("Scatterplot")
```
The data show no suspicious elements in the scatterplot. There doesn't seem to be any time drift..

H~0~ Distribution is stationary\
The significance level is set to  $\alpha = 5\proz$
```{r warning=F}
summary_kpss <- dat2a proz>proz  summarise(kpss_p=kpss.test(ra)$p.value)
summary_kpss proz>proz mutate_if(is.numeric, format, digits=2,nsmall = 1) proz>proz
  kbl(.,"html",align = "r",caption = "KPSS Test Results ") proz>proz   kable_styling(bootstrap_options = c("striped", "hover", "condensed", "responsive")) 
```
H~0~ cannot be rejected because ($p>\alpha$ ).\
Data seems to be stationary.

Eliminate time as variable since no time drift was seen initially, so the reduced model does not require the time
```{r}
dat2a<-dat2a[-1]
```
##### Visualize data
```{r message=F}
ggpairs(dat2a,lower = list(continuous = wrap("smooth", alpha = 0.3, size=0.1)))
```
c and f seem to be relevant. But d and n could also be relevant.

### Set up a linear model
H~01~: c has no effect\
H~02~: f has no effect\
H~03~: d has no effect\
H~04~: n has no effect\
H~05~: cf has no effect\
H~06~: cd has no effect\
H~07~: cn has no effect\
H~08~: fd has no effect\
H~09~: fn has no effect\
H~010~: dn has no effect\
H~011~: cfd has no effect\
H~012~: cfn has no effect\
H~013~: cdf has no effect\
H~014~: fdn has no effect\
H~015~: cfdn has no effect\
significance level  $\alpha=0.05$\

```{r warning=F, message=F, error = T}
mod2a=lm(ra~.^2,data=dat2a) # linear model
summary(mod2a)
```
$p>\alpha \forall H_0$ except H~01~ therefore no factor seems to make a significant effect except factor c.\

#### visualize effects
```{r warning=F, message=F, error = T}
MEPlot(mod2a)
```
all effects seem to have a main effect on ra.

#### visualize interactions
```{r warning=F, message=F, error = T}
IAPlot(mod2a)
```
all factors seem to have at least slight interactions.

check if a reduced model is appropriate with BIC.
```{r}
mod2ar <- stepAIC(mod2a,k=log(nrow(dat2a)),direction = "both",trace = 0)
summary(mod2ar)
```
reduced model from BIC removes all interactions except d:n

### verify performance of reduced model
 H~0~ both models have the same quality.\
significance level  $\alpha=0.05$\

```{r}
anova(mod2a,mod2ar)
```
$p>\alpha \therefore H_0$ cannot be rejected.\
Both models seem to perform equally

## Find Optimum with rsm 
### First run
#### Generate coded data set
```{r warning=F, message=F, error = T}
do1<-dat2a
opt_x1 <- 200 #current opt param. stated in exercise of factor 1
opt_x2 <- 0.15 #current opt param. stated in exercise of factor 2
opt_x3 <- 0.8 #current opt param. stated in exercise of factor 3
opt_x4 <- 4 #current opt param. stated in exercise of factor 4
co1=list(x1 ~ (c - opt_x1)/(opt_x1*(1-0.8)), x2 ~ (f - opt_x2)/(opt_x2*(1-0.8)), x3 ~ (d - opt_x3)/(opt_x3*(1-0.8)), x4 ~ (n -opt_x4)/(opt_x4*(1-0.8))) #(orig - center) / divisor
do1c <- coded.data(do1, formulas = co1)
do1c
```
####  Set up a response surface model
```{r warning=F, message=F, error = T}
mo1=rsm(ra~FO(x1,x2,x3,x4)+TWI(x1,x2,x3,x4),data=do1c) # linear model
summary(mo1)
```
#### Plotting results
```{r warning=F, message=F, error = T}
par(mfrow = c(2,3))
contour(mo1, ~ x1 + x2 + x3 + x4,image = TRUE)
```
#### Get the direction of steepest descent and create test plan with points in distance steps of 0.5
```{r warning=F, message=F, error = T}
plans1=steepest(mo1,dist=seq(0,4,.5),descent = T) #descent=T for minimum search
plans1=plans1[-(1:6)] #remove unnecessary columns (keep only c,f,d,n columns)
plans1=plans1[-(5:6)]
nr=3
plans1=do.call("rbind", replicate(nr, plans1, simplify=F))
plans2=steepest(mo1,dist=seq(0,4,.5),descent = T) #descent=T for minimum search
plans2
```
#### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plano1.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plans1,file="plano1.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```
#### Read data from test plan with steepest descent
```{r warning=F, message=F, error = T}
dos1 = read.delim("plano1_res.csv", header = TRUE,sep = ";", dec = ".")
head(dos1)
```
#### compare steepest descent model with data to see where they deviate
```{r warning=F, message=F, error = T, fig.width=12}
dos1t=dos1[-1] # first remove time column
dos1v=cbind(rep("measured",nrow(dos1t)),dos1t) # add a name column to measurements
colnames(dos1v)<-c("data","c","f","d","n","ra")

plans1=steepest(mo1,dist=seq(0,4,.5),descent = T)
plans1=plans1[-(1:6)] # extract from the model, what is of interest
plans1=plans1[-(5)]   # extract from the model, what is of interest
plans1=cbind(rep("model",nrow(plans1)),plans1) # add a name column to steepest decent model
colnames(plans1)<-c("data","c","f","d","n","ra")
dos1v=rbind(dos1v,plans1) # combine model and measurement to one data set
ggline(data=dos1v, x = "c",y="ra", ylab = "ra",  add = "mean_sd", color = "data", palette = "jco")
```
The steepest decent and the data start to deviate at about c=276

##### new starting point
```{r warning=F, message=F, error = T}
newstart1=plans1[,-1][6,] #remove first column (data) with -1 and extract 6th row with c=~276 as new startpoint
newstart1=plans1[,-1][6,]
newstart1
```

### Second run
#### set up a central-composite design around new start point
```{r warning=F, message=F, error = T}
co2=list(x1 ~ (c - newstart1$c)/70, x2 ~ (f - newstart1$f)/0.07, x3 ~ (d-newstart1$d)/0.16, x4 ~ (n-newstart1$n)/.8) #(orig - center) / divisor, erstellt ccd um startpunkt z.b. für c: max(c)=startpunkt+70, min(c)=startpunkt-70
plan2=decode.data(ccd(4, n0 = 1,alpha = "rotatable", inscribed = TRUE, coding = co2)) #n0=1=1 centerpoint
plan2=plan2[-(1:2)]
plan2=plan2[-5]
nr=3
plan2=do.call("rbind", replicate(nr, plan2, simplify=F))
plan2=plan2[order(sample(1:nrow(plan2))),] # randomize design
```

#### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plano2.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plan2,file="plano2.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

#### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
do2 = read.delim("plano2_res.csv", header = TRUE,sep = ";", dec = ".")
head(do2)
do2=do2[-1]
```

#### Generated coded data set
```{r warning=F, message=F, error = T}
do2c <- coded.data(do2, formulas = co2)
```

####  Set up a response surface model
```{r warning=F, message=F, error = T}
mo2=rsm(ra~SO(x1,x2,x3,x4),data=do2c) # square model
summary(mo2)
```
#### Plotting results
```{r warning=F, message=F, error = T}
par(mfrow = c(2,3))
contour(mo2, ~ x1 + x2 + x3 + x4,image = TRUE)
```
##### Get the direction of steepest descent with smaller distance steps 0.3
```{r warning=F, message=F, error = T}
plans2=steepest(mo2,dist=seq(0,2.1,.3),descent = T)
plans2=plans2[-(1:6)]
plans2=plans2[-(5:6)]
nr=3
plans2=do.call("rbind", replicate(nr, plans2, simplify=F))
```

#### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plano3.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plans2,file="plano3.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```
#### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
dos2 = read.delim("plano3_res.csv", header = TRUE,sep = ";", dec = ".")
head(dos2)
```

#### compare model with data
```{r warning=F, message=F, error = T, fig.width=15,fig.height=6}
dos2t=dos2[-1] # first remove time column
dos2v=cbind(rep("measured",nrow(dos2t)),dos2t) # add a name column to measurements
colnames(dos2v)<-c("data","c","f","d","n","ra")
plans2=steepest(mo2,dist=seq(0,2.1,.3),descent = T)
plans2=plans2[-(1:6)] # extract from the model, what is of interest
plans2=plans2[-(5)]   # extract from the model, what is of interest
plans2=cbind(rep("model",nrow(plans2)),plans2) # add a name column to steepest decent model
colnames(plans2)<-c("data","c","f","d","n","ra")
dos2v=rbind(dos2v,plans2) # combine model and measurement to one data set
ggline(data=dos2v, x = "c",y="ra", ylab = "ra",  add = "mean_sd", color = "data", palette = "jco")
```
The smallest value is reached for 283.38.

##### new starting point
```{r warning=F, message=F, error = T}
newstart2=plans2[,-1][8,]
rbind(newstart1,newstart2)
```
f seems to reach its minimum value

#### Third run
##### set up a central-composite designs 
```{r warning=F, message=F, error = T}
co3=list(x1 ~ (c - newstart2$c)/70, x2 ~ (f - newstart2$f)/0.01, x3 ~ (d-newstart2$d)/0.16,x4~(n-newstart2$n)/.4)
plan3=decode.data(ccd(4, n0 = 1,alpha = "rotatable", inscribed = TRUE, coding = co3))
plan3=plan3[-(1:2)]
plan3=plan3[-5]
nr=3
plan3=do.call("rbind", replicate(nr, plan3, simplify=F))
```

##### Write test plan to file
```{r warning=F, message=F, error = T}
# First line writes the Matrikelnummer
write.table(matrikelnumber,file="plano4.csv",sep = ";", dec = ".",row.names = F, col.names = F, append = F)
# Second line writes the test plan
write.table(plang3,file="plano4.csv",sep = ";", dec = ".",row.names = F, col.names = T, append = T)
```

##### Read data
Read data and have a first glance at them. (1st plot)
```{r warning=F, message=F, error = T}
do3 = read.delim("plano4_res.csv", header = TRUE,sep = ";", dec = ".")
head(do3)
do3=do3[-1]
```

##### Generate coded data set
```{r warning=F, message=F, error = T}
do3c <- coded.data(do3, formulas = co3)
```

#####  Set up a response surface model
```{r warning=F, message=F, error = T}
mo3=rsm(ra~SO(x1,x2,x3,x4),data=do3c) # linear model
summary(mo3)
```

##### Plotting results
```{r warning=F, message=F, error = T}
par(mfrow = c(2,3))
contour(mo3, ~ x1 + x2 + x3 + x4 ,image = TRUE)
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

