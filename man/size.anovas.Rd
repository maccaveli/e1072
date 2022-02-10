\name{size.anovas}
\alias{size.anovas}
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




#################TEX####
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

In the first step one machine is characterized on the current process\
# 1. Characterize the current roughness with a relative precision of 5 perc. Do this in two steps.
Setup appropriate test plans, analyse them, and check, if the target relative precision is achieved.
# 2. Calculate Characteristic numbers
## 2. a,b,c) what is a typical value? (2 values), how far is the data typically spreading? (2 values),is the data symmetrically distributed? (2 values)
# 3. Characterise the data further and interpret results
## 3.)a) Generate four plots
## 3.)b) Do two statistical hypothesis tests
# 4.) Write down the essential steps you always have to take for any statistical test / hypothesis testing. 
# 5.) Next the machine is characterized in the allowed parameter range. Assume that the performance (ra) is linear.
Set up a test plan for the characterisation of the machine (ma) 1. (Do 10 replicates for each level.) 
# 6.) What are four characteristics of a good DOE test plan?
# 7.) And set up a linear model for the full parameter range (5.). Shortly discuss the result. 
# 8.) Extra point: Visualize the results of the full model. (2 plots)
# 9.) Extra point: Test the three assumptions of the full linear model. (1 plot and 1 test for each assumption) 
# 10.) Extra points: Set up a testing plan to be able to compare the machines 1 and 2 over the whole range. (Do 10 replicates for each level)
# 11.) Extra points: Compare the performance of the two machines
# 12.) Extra points: Calculate the number of replications that would be needed to resolve the smallest main effect still with a 95perc certainty. (You should take data only from one machine.) 












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












#################7####
two machines (ma) that have two control parameters (turning speed (ts), feederate (fr))
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












############8#
new machine for your company. You have five factors that can be manipulated between 0
and 2. And you assume that interactions between two factors can be relevant. However, you are sure
that three factor interaction do not play any role. You are asked to run a minimum of tests for the
start, but to have at least 3 replications

## 8.1.1 What is the right resolution for this problem?
5 factors that can be manipulated. Two-fold interactions are relevant, three-fold interactions are not relevant
-> resolution should be at least 5, because with a resolution of 4 still the twofold interactions are confounded (2*2=4).
## 8.1.2 How many experiments do you need?
With a resolution of 5 and 5 factors with 2 levels, the necessary number of runs is 2^(5-1)=16.
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















##########9##
found a new chemical that precipitated at the end of the reaction. For the next reaction you
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
















########10##
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













Characterizing Data
1. Read and check data
	1. Check for NA, if there are NAs decide what to do with them
	2. Check variable classes and change if necessary
		1. categorical variables: “ftc”, factor
		2. count variables: “int”, integer
		3. (continuous) numerical variables: “dbl”, numeric
2. Calculate characteristic numbers and compare them to appropriate references. The
scale is often given by the corresponding error.
	1. Mean and Median (to get the “most representative”/ “average”)
	2. Standard deviation and MAD (to get the “typical width”)
	3. Skewness and Medcouple (to see if the data are symmetrically distributed)
	4. Kurtosis
3. Investigate data further
	1. Is there drift?
		1. V: Scatter plot; H: KSPP test
	2. Are there autocorrelations or oscillations?
		1. V: Autocorrelation plot; H: Durbin-Watson-Test, V: Spectral analysis
	3. How are the data distributed?
		1. V: Density plot / Histogram
	4. Are data normal distributed?
		1. V: QQ-Plot; H: Shapiro Wilk test
	5. Are there outlier?
		1. V: Box-Notch-Plot; H: Rosner Outlier Test (Generalized ESD) 







# 4.) Write down the essential steps you always have to take for any statistical test / hypothesis testing. 
1. state H~0~ (Null Hypothesis) and alternative
2. set significance level $\alpha$
3. choose appropriate statistics/distribution
4. analyze data (p-value)
   - if necessary test the made assumptions for the test, e.g. test for normal distribution, equal variance
   - run the hypothesis test itself 
5. interpret result mathematically compare p-value to alpha
6. express results in plain language understandable for non-statisticians
7. Visualize results




Compare Groups of Data
1. Read and check data
	1. Check for NA, if there are NAs decide what to do with them
	2. Check variable classes
		1. categorical variables: “ftc”, factor
		2. count variables: “int”, integer
		3. (continuous) numerical variables: “dbl”, numeric
	3. Grouping variable has to be a categorical variable (“factor”)
	4. Dependent variable is numeric (?)
2. State hypothesis and significance level
3. Check Assumptions
	1. Are data normal distributed? (if not  non-parametric test)
	2. Are variances equal? (if no and only to groups  Welch test)
4. Run ANOVA
5. Write mathematical interpretation
6. Write interpretation in common language
7. Visualize data, e.g. use Box-Notch-Plot




Linear Regression of Data
1. Get a first overview:
	1. Check that all variables have the appropriate type, e.g. numeric, factor, …
	2. Do a scatter plot to check, if a linear regression is reasonable
2. Do the linear regression (R: lm)
3. Check (adjusted) r2, F-value, p-values (how good is the fit?)
4. Visualize the results of the fit. (if possible overlay data with fit)
5. Test assumptions:
	1. Test normal distribution of residuals (i.e. R: QQ-plot of residuals and
	sharpiro.test(model$residuals) )
	2. Check for Homoscedasticity (homogeneity of residuals) (i.e. spreadLevelPlot
	(alternative: residual or standard. residuals vs fitted data)
	and run a Non-constant Variance Score Test R: ncvTest())
3. Check for (high leverage) outliers (i.e. R: plot: stand. residuals vs
fitted data, Cooks distance vs data and vs leverage, and compare Cooks
distance to critical Cooks distance, … )
4. Check for autocorrelation (dependencies) of the residuals with the DurbinWatson test (R: durbinWatsonTest(model)) and autocorrelation plot (R: acf)
5. In case of Multivariant Regression check for Multicollinearity (R: vif(model),
critical values above 4 and a correlation plot R: ggpairs(data))
6. For more complex models check with BIC (or AIC) and/or ANOVA, if a reduced model
would do the same (better) job





Process of gaining knowledge in empirical science
1. Formulation of the problem / Defining objectives / State Hypothesis
	-On what will be measured?
	(Identifying experimental units)
	-What will be measured?
	(depended variable which will be evaluated for effects or models)
	-What shall be the outcome?
	(first overview? model? model validation? optimisation?)
	-Which factors does the outcome depend on?
	(independent variables: factors to be changed, nuisance factors, …)
2. Fixing the precession requirements
3. Selecting the statistical model (for planning and analysis)
4. Construction of the (optimal) design
5. Performing experiments
6. Statistical analysis
7. Visualize the results
8. Interpreting results





Quality factors of good experimental designs
• Factors are independent -> avoiding Multicollinearity
• Orthogonality -> Maximize the information gathered, e.g. factorial designs
• Balanced -> Avoiding Simpsons Paradox
• Randomized -> To address unknown nuisance factors like drift
• Blocked -> Known nuisance factors are blocked out
• Replication fit to the anticipated statistical power of the model
• Resolution fits to the anticipated degrees of interaction of factors
• Rotatable, especially for optimization via response surface designs



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

