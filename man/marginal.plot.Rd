\name{marginal.plot}
\alias{marginal.plot}
\title{
Plot Posterior Marginal Inclusion Probabilities
}
\description{
For each time point in the time series, the posterior probability of it being a changepoint time is computed using MCMC method and is plotted as height of the bar here. 
}
\usage{
marginal.plot(results.mcmc, meta.loc = NULL, cex = 1, burnin = 0.2, file.name = NULL, ...)
}
\arguments{
  \item{results.mcmc}{
output of function \code{\link{bcpmeta.model}}, record of configurations that are visited by the MCMC.}
  \item{meta.loc}{
the y-coordinate of the x-axis, for the purpose of mark crosses on the x-axis to indicate metadata locations; optional.
}
  \item{cex}{
width (size) of lines and lables.
}
  \item{burnin}{
the ratio of burnin length compared with the total length of MCMC.
Estimates of posterior inclusion probabilites are calculated without burnin periods. 
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
Function \code{\link{bcpmeta.model}}
}
\examples{
## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## For illustration purpose, number of MCMC iteration is set to a small value.
results = bcpmeta.model(X, meta = meta, iter = 1e3, trend = FALSE); 

marginal.plot(results, xlab = 'time', ylab = 'probability');
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
\keyword{ changepoint }
\keyword{ MCMC }