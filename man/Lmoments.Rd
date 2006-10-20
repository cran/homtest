% 2005-09-23, Alberto Viglione
%
\name{Lmoments}
\alias{Lmoments}
\alias{regionalLmoments}
\alias{LCV}
\alias{LCA}
\alias{Lkur}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{Hosking and Wallis sample L-moments}
\description{
 Lmoments provides the estimate of L-moments of a sample or regional L-moments of a region.
}
\usage{
 Lmoments (x)
 regionalLmoments (x,cod)
 LCV (x)
 LCA (x)
 Lkur (x)
}
%- maybe also `usage' for other objects documented here.
\arguments{
 \item{x}{vector representing a data-sample (or data from many samples defined with 'fac' in the case of 'regionalLmoments')}
 \item{cod}{array that defines the data subdivision among sites}
}
\details{
 .
}
\value{
 'Lmoments' gives the L-moments (l1, l2, lcv, lca, lkur), 'regionalLmoments' gives the regional weighted L-moments (l1R, l2R, lcvR, lcaR, lkurR), 'LCV' gives the coefficient of L-variation, 'LCA' gives the L-skewness and 'Lkur' gives the L-kurtosis of 'x'.
}
\references{Hosking, J.R.M. and Wallis, J.R. (1997) Regional Frequency Analysis: an approach based on L-moments, Cambridge University Press, Cambridge, UK.}

\author{Alberto Viglione, e-mail: \email{alviglio@tiscali.it}.}

\note{.}

\seealso{\code{\link{HOMTESTS}}}

\examples{
x <- rnorm(30,10,2)
Lmoments(x)

data(annualflows)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)
camp <- split(x,cod)$"45"
Lmoments(camp)
sapply(split(x,cod),Lmoments)

regionalLmoments(x,cod)
}
\keyword{univar}
