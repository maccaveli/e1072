\name{size.anova9}
\alias{size.anova9}
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






}

}
\keyword{ anova }

