\name{size.anova10}
\alias{size.anova10}
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

