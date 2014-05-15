\name{bcpmeta-package}
\alias{bcpmeta-package}
\alias{bcpmeta}
\docType{package}
\title{
Bayesian Multiple Changepoint Detection Using Metadata
}
\description{
Package for a Bayesian multiple changepoint detection method 
to detect mean shifts in AR(1) time series.  
It accomodates metadta (if available) by 
letting metadata times have higher prior probabilities 
to be changepoints.  
The changepoint configuration with the highest
posterior probability is the optimal model.  
Metropolis-Hastings algorithm is utilized for 
quick stochastic search of a potentially huge model space.  
This method is ideal for annual series, 
since it allows a linear trend component, but not yet monthly cycles.   
}
\details{
\tabular{ll}{
Package: \tab bcpmeta\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-05-15\cr
License: \tab GPL(>= 2)\cr
}
The most important functions of this package:\cr
\code{\link{bcpmeta.model}}: 
	find the optimal changepoint configuration,\cr
\code{\link{bcpmeta.parameters}}: 
	given a configuration, estimate model parameters.
}
\author{
Yingbo Li

Maintainer: Yingbo Li <ybli@clemson.edu>
}
\references{
  Li, Y. and Lund, R. (2014) Bayesian Mulitple Changepoint
  Detection Using Metadata. (submitted)
}
%~~ Optionally other standard keywords, one per line, ~~
%~~ from file KEYWORDS in the R documentation ~~
%~~ directory ~~
\keyword{ package }
\keyword{ changepoint }
%\seealso{
%~~ Optional links to other man pages, e.g. ~~
%~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
%}
%\examples{
%~~ simple examples of the most important functions ~~
%}
