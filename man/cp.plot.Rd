\name{cp.plot}
\alias{cp.plot}
\title{
Plot a Changepoint Configuration
}
\description{
Plot regimes-means (dashed line) against observational series (solid line). 
}
\usage{
cp.plot(results.parameter, meta.loc = NULL, cex = 1, file.name = NULL, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{results.parameter}{
output of function \code{\link{bcpmeta.parameters}}, etimates of parameters in a certain changepoint configuration.
}
  \item{meta.loc}{
the y-coordinate of the x-axis, for the purpose of mark crosses on the x-axis to indicate metadata locations; optional.
}
  \item{cex}{
width (size) of lines and lables.
}
  \item{file.name}{
optional; if specified, then the plot is saved to a .ps file under this file name.
}
  \item{\dots}{
Arguments to be passed to methods, such as graphical parameters (see \code{\link{par}}).
}
}
\details{
Metadata times are marked as crosses on the x-axis, if argument \code{meta.loc} is not \code{NULL}.
}
%\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
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
Function \code{\link{bcpmeta.parameters}}
}
\examples{
## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## Parameter estimation in the configuration where changepoints are time 50 and 99.
results = bcpmeta.parameters(X, meta = meta, eta = c(50, 99), trend = FALSE);  

## Plot
cp.plot(results, meta.loc = -0.42, cex = 1.5);
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
\keyword{ changepoint }
\keyword{ MCMC }
