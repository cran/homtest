% 2005-09-23, Alberto Viglione
%
\name{HOMTESTS}
\alias{HOMTESTS}
\alias{ADbootstrap.test}
\alias{HW.tests}
\alias{DK.test}
\alias{discordancy}
\alias{criticalD}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{Homogeneity tests}
\description{
 Homogeneity tests for Regional Frequency Analysis.
}
\usage{
 ADbootstrap.test (x,cod,Nsim=500,index=2)
 HW.tests (x,cod,Nsim=500)
 DK.test (x,cod)
}
%- maybe also `usage' for other objects documented here.
\arguments{
 \item{x}{vector representing data from many samples defined with `cod'}
 \item{cod}{array that defines the data subdivision among sites}
 \item{Nsim}{number of regions simulated with the bootstrap of the original region}
 \item{index}{if index=1 samples are divided by their average value;
              if index=2 (default) samples are divided by their median value}
}
\details{
 A practical problem in regional frequency analysis is the choice of a test for regional homogeneity assessment.
 The comparison in Viglione et al. (2006) shows that the Hosking and Wallis heterogeneity measure HW1 (only based on L-CV) is preferable when skewness is low, while the bootstrap Anderson-Darling test should be used for more skewed regions.
 As for HW2, the Hosking and Wallis heterogeneity measure based on L-CV and L-CA, it is shown once more how much it lacks power.

 Our suggestion is to guide the choice with this expedient:
 if the t3 coefficient for the region under analysis is lower than 0.23, we propose to use the Hosking and Wallis heterogeneity measure HW1;
 if t3 > 0.23, the bootstrap Anderson-Darling test is preferable.

}
\value{
  `ADbootstrap.test' and `DK.test' test gives its test statistic and its distribution value P.
  If P is, for example, 0.92, samples shouldn't be considered heterogeneous with significance level minor of 8\%.

  `HW.tests' gives the two Hosking and Wallis heterogeneity measures H1 and H2; following Hosking and Wallis (1997), the region under analysis can therefore be regarded as `acceptably homogeneous' if H1<1, `possibly heterogeneous' if 1<=H1<2, and `definitely heterogeneous' if H>=2.
}
\references{
Hosking, J.R.M. and Wallis, J.R. (1997) Regional Frequency Analysis: an approach based on L-moments, Cambridge University Press, Cambridge, UK.

Viglione A., Laio F., Claps P. (2006) ``A comparison of homogeneity tests for regional frequency analysis'', in revision.
}
\author{Alberto Viglione, e-mail: \email{alviglio@tiscali.it}.}

\note{
}

\seealso{\code{\link{KAPPA}}, \code{\link{Lmoments}}}

\examples{
data(annualflows)
annualflows[1:10,]
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)

#ADbootstrap.test(x,cod,Nsim=100)   # it takes some time
#HW.tests(x,cod)                    # it takes some time
DK.test(x,cod)

fac <- factor(annualflows["cod"][,],levels=c(34:38))
x2 <- annualflows[!is.na(fac),"dato"]
cod2 <- annualflows[!is.na(fac),"cod"]
split(x2,cod2)
sapply(split(x2,cod2),Lmoments)
regionalLmoments(x2,cod2)

ADbootstrap.test(x2,cod2)
ADbootstrap.test(x2,cod2,index=1)
HW.tests(x2,cod2)
DK.test(x2,cod2)
}
\keyword{htest}
