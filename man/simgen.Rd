\name{simgen}
\alias{simgen}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate Simulation Data
}
\description{
Generate independent time series to apply changepoint
 detection methods on, according to the rules described
 in the reference, Section 5, Sceario 1 - 3.
}
\usage{
simgen(scenario, N = 1000)
}
\arguments{
  \item{scenario}{
scenario type. Can be chosen from 1, 2, or 3.
}
  \item{N}{
number of independent series to generate.
}
}
%\details{
%%  ~~ If necessary, more details than the description above ~~
%}
\value{
  \item{X}{
a \code{N} * \code{200} matrix, each row is a simulated time series.
}
  \item{meta}{
locations of metadata times.
}
  \item{scenario}{
scenario type. Can be chosen from 1, 2, or 3; the same as input.
}
  \item{N}{
number of independent series to generate; the same as input.
}
}
\references{
  Li, Y. and Lund, R. (2014) Bayesian Mulitple Changepoint
  Detection Using Metadata. (submitted)
}
\author{
Yingbo Li

Maintainer: Yingbo Li <ybli@clemson.edu>
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{bcpmeta.model}}, \code{\link{bcpmeta.parameters}}
}
\examples{
## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
\keyword{ changepoint }
\keyword{ MCMC }