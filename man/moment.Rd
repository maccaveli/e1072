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
}
\details{
  When \code{center} and \code{absolute} are both \code{FALSE}, the
  moment is simply \code{sum(x ^ order) / length(x)}.
}
\author{Kurt Hornik and Friedrich Leisch}
\seealso{
  \code{\link{mean}},
  \code{\link{var}}}
\examples{
x <- rnorm(100)

Characteristic Values in Table
values1=c(mean(s1),median(s1),sd(s1),mad(s1),min(s1),quantile(s1,0.25),quantile(s1,0.75),max(s1),skewness(s1),mc(s1),kurtosis(s1))
values2=c(mean(s2),median(s2),sd(s2),mad(s2),min(s2),quantile(s2,0.25),quantile(s2,0.75),max(s2),skewness(s2),mc(s2),kurtosis(s2))
values3=c(mean(s3),median(s3),sd(s3),mad(s3),min(s3),quantile(s3,0.25),quantile(s3,0.75),max(s3),skewness(s3),mc(s3),kurtosis(s3))
values4=c(mean(s4),median(s4),sd(s4),mad(s4),min(s4),quantile(s4,0.25),quantile(s4,0.75),max(s4),skewness(s4),mc(s4),kurtosis(s4))
column.names <- c("mean","median","$\\sigma$","MAD","Min","Q1","Q3","Max","skewness","Medcouple","kurtosis")
row.names <- c("s1","s2","s3","s4")
results = array(rbind(values1,values2,values3,values4),dim = c(4,11),dimnames = list(row.names,column.names))
kable(results)

## Compute the mean
moment(x)
## Compute the 2nd centered moment (!= var)
moment(x, order=2, center=TRUE)

## Compute the 3rd absolute centered moment
moment(x, order=3, center=TRUE, absolute=TRUE)
}
\keyword{univar}