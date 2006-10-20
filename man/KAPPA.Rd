% 2005-09-23, Alberto Viglione
%
\name{KAPPA}
\alias{KAPPA}
\alias{f.kappa}
\alias{F.kappa}
\alias{invF.kappa}
\alias{Lmom.kappa}
\alias{par.kappa}
\alias{rand.kappa}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{Four parameter kappa distribution}
\description{
KAPPA provides the link between L-moments of a sample and the four parameter
kappa distribution.
}
\usage{
f.kappa (x,xi,alfa,k,h)
F.kappa (x,xi,alfa,k,h)
invF.kappa (F,xi,alfa,k,h)
Lmom.kappa (xi,alfa,k,h)
par.kappa (lambda1,lambda2,tau3,tau4)
rand.kappa (numerosita,xi,alfa,k,h)
}
%- maybe also `usage' for other objects documented here.
\arguments{
 \item{x}{vector of quantiles}
 \item{xi}{vector of kappa location parameters}
 \item{alfa}{vector of kappa scale parameters}
 \item{k}{vector of kappa third parameters}
 \item{h}{vector of kappa fourth parameters}
 \item{F}{vector of probabilities}
 \item{lambda1}{vector of sample means}
 \item{lambda2}{vector of L-variances}
 \item{tau3}{vector of L-CA (or L-skewness)}
 \item{tau4}{vector of L-kurtosis}
 \item{numerosita}{numeric value indicating the length of the vector to be generated}
}
\details{
 'Lmom.kappa' and 'par.kappa' accept input as vectors of equal length. In 'f.kappa', 'F.kappa', 'invF.kappa' and 'rand.kappa' parameters (xi,alfa,k,h) must be atomic.
}
\value{
 'f.kappa' gives the density (f), 'F.kappa' gives the distribution function (F), 'invFkappa' gives
the quantile function (x), 'Lmom.kappa' gives the L-moments (lambda1, lambda2, tau3, tau4), 'par.kappa'
gives the parameters (xi, alfa, k, h), and 'rand.kappa' generates random deviates.
}
\references{Hosking, J.R.M. and Wallis, J.R. (1997) Regional Frequency Analysis: an approach based on L-moments, Cambridge University Press, Cambridge, UK.}

\note{.}

\seealso{\code{\link{HOMTESTS}}, \code{\link{rnorm}}, \code{\link{runif}}}

\examples{
data(annualflows)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
fac <- factor(annualflows["cod"][,])
split(x,fac)

camp <- split(x,fac)$"45"
ll <- Lmoments(camp)
parameters <- par.kappa(ll[1],ll[2],ll[4],ll[5])
f.kappa(1800,parameters$xi,parameters$alfa,parameters$k,parameters$h)
F.kappa(1800,parameters$xi,parameters$alfa,parameters$k,parameters$h)
invF.kappa(0.771088,parameters$xi,parameters$alfa,parameters$k,parameters$h)
Lmom.kappa(parameters$xi,parameters$alfa,parameters$k,parameters$h)
rand.kappa(100,parameters$xi,parameters$alfa,parameters$k,parameters$h)

Rll <- regionalLmoments(x,fac); Rll
parameters <- par.kappa(Rll[1],Rll[2],Rll[4],Rll[5])
Lmom.kappa(parameters$xi,parameters$alfa,parameters$k,parameters$h)
}
\keyword{distribution}
