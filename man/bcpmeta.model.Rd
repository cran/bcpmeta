\name{bcpmeta.model}
\alias{bcpmeta.model}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Identify the Optimal Changepoint Configuration
}
\description{
Implement a MCMC algorithm to quick search 
for the optimal changepoint configuration
that has the largest posterior probability.
}
\usage{
bcpmeta.model(X, meta, iter = 10000, thin = 10, trend = TRUE, 
              EB = TRUE, mu0 = NULL, nu0 = 5, a1 = 1, a2 = 1, 
              b1 = 19, b2 = 3, phi.lower = -0.99, phi.upper = 0.99, 
              start.eta = NULL, track.time = TRUE, show.summary = TRUE, 
              start.year = 1, meta.year = FALSE)
}
\arguments{
  \item{X}{
a numerical vector. Observed time series.
}
  \item{meta}{
metadata.  Either a vector of 0-1 indicators of the same length as \code{X},
or a numerical vector of the time indice of the metadata times.
}
  \item{iter}{
total number of iterations of MCMC.
}
  \item{thin}{
thinning; save one iteration in every \code{thin}
number of iterations.
}
  \item{trend}{
logical indicating whether to allow the linear trend component.
}
  \item{EB}{
logical indicating whether to use the empirical Bayes method
for \var{sigma^2} and \var{phi}.
}
  \item{mu0}{
prior mean of regime-wise means \var{mu_j}.  
If \code{NULL}, set to the default value \code{mean(X)}.
}
  \item{nu0}{
constant factor in prior variance of regim-wise means \var{mu_j}.
}
  \item{a1}{
the first parameter in the Beta-Binomial prior of non-metadata times.
}
  \item{a2}{
the first parameter in the Beta-Binomial prior of metadata times.
}
  \item{b1}{
the second parameter in the Beta-Binomial prior of non-metadata times.
}
  \item{b2}{
the second parameter in the Beta-Binomial prior of metadata times.
}
  \item{phi.lower}{
lower bound of the range of \var{phi}
}
  \item{phi.upper}{
upper bound of the range of \var{phi}
}
  \item{start.eta}{
initial value of the changepoint configuration \var{eta}
for the MCMC.  If \code{NULL}, generated randomly.
}
  \item{track.time}{
logical indicating whether to show process time.
}
  \item{show.summary}{
logical indicating whether to show the top 5 configurations.
}
  \item{start.year}{
year index of the first time point in the series.
}
  \item{meta.year}{
logical indicating whether \code{meta} is indexed in year, 
if it consists of the locations of the metadata times (instead of 0-1 indicators).
}
}
\details{
A Metropolis-Hastings algorithm with interwine of two
transitions, a component-wise updating and a simple random swapping.  
See \code{references} for details.
}
\value{
\item{Eta}{a \code{(iter/thin+1)} * \code{length(X)} matrix.   
	Each row is a changepoint configuration visited by MCMC,
	in the format of a vector 0-1 indicators.}

\item{map200}{a \code{200} * \code{(length(X) + 3)} matrix.  
	The best 200 changepoint configurations, listed in desecending order.  
	Each row is a vector of 0-1 indicators, followed by 
	\code{lml} (log likelihood up to a constant), 
	\code{phi.eb} (if \code{EB == TRUE}, 
	the empirical Bayes estimate of \var{phi} under that configuration)
	and \code{lpost} (log posterior up to a constant).}

\item{X}{observed time series, same as the input value.}

\item{meta}{metadata, same as the input value.}

\item{input.parameters}{input parameters. Use command \code{names} to check
	its components.}
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
Function \code{\link{marginal.plot}} uses the output of this function as input.
}
\examples{
## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## For illustration purpose, number of MCMC iteration is set to a small value.
results = bcpmeta.model(X, meta = meta, iter = 1e3, trend = FALSE); 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
\keyword{ changepoint }
\keyword{ MCMC }
