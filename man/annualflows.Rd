% 2005-09-23, Alberto Viglione
%
\name{annualflows}
\docType{data}
\alias{annualflows}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{Data-sample}
\description{
...
}
\usage{
 annualflows
}
\format{Data.frame containing annual flow data of 47 stations.}
\source{}
\references{}
\examples{
data(annualflows)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,] 
split(x,cod)
sapply(split(x,cod),mean)
sapply(split(x,cod),median)
sapply(split(x,cod),quantile)
sapply(split(x,cod),Lmoments)
}
\keyword{datasets}
