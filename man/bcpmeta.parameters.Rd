\name{bcpmeta.parameters}
\alias{bcpmeta.parameters}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimate Model Parameters under a Given Configuration}
\description{
Given a changepoint configuration, use Gibbs sampler
(or Metropolis-Hastings algorithm within Gibbs)
to find posterior mean estimates of model parameters.
}
\usage{
bcpmeta.parameters(X, meta, eta, iter = 10000, thin = 10, trend = TRUE, 
                   EB = TRUE, mu0 = NULL, nu0 = 5, phi.lower = -0.99,
                   phi.upper = 0.99, sd.xi = 0.1, start.phi = NULL, 
                   burnin = 0.2, track.time = TRUE, show.summary = TRUE,
                   start.year = 1, meta.year = FALSE, eta.year = FALSE)
}
\arguments{
  \item{X}{
a numerical vector. Observed time series.
}
  \item{meta}{
metadata.  Either a vector of 0-1 indicators of the same length as \code{X},
or a numerical vector of the time indice of the metadata times.
}
  \item{eta}{
the changepoint configuration.  Either a vector of 0-1 indicators of the same length as \code{X},
or a numerical vector of the time indice of the changepoint times.
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
  \item{phi.lower}{
lower bound of the range of \var{phi}
}
  \item{phi.upper}{
upper bound of the range of \var{phi}
}
  \item{sd.xi}{
standard deviation of the jump proposal of \var{log(phi)}
in Metropolis-Hastings updating when the fully Bayes method is used.
}
  \item{start.phi}{
initial value \var{phi} for the MCMC when the fully Bayes method is used.  If \code{NULL}, generated randomly.
}
  \item{burnin}{
the ratio of burnin length compared with the total length of MCMC.
All posterior mean estimates are calculated without burnin periods. 
}
  \item{track.time}{
logical indicating whether to show process time.
}
  \item{show.summary}{
logical indicating whether to show the estimates of parameters.
}
  \item{start.year}{
year index of the first time point in the series.
}
  \item{meta.year}{
logical indicating whether \code{meta} is indexed in year, 
if it consists of the locations of the metadata times (instead of 0-1 indicators).
}
  \item{eta.year}{
logical indicating whether \code{eta} is indexed in year, 
if it consists of the locations of the metadata times (instead of 0-1 indicators).
}
}
\details{
Conditional on the given changepoint configuration \var{eta},
the posterior mean estimates of regime-wise mean \var{mu} and trend \var{alphla} (if \code{trend == TRUE}) is obtained via Gibbs sampler.
If \code{EB == TRUE}, empirical Bayes estimates of \var{sigma2} and \var{phi} are given; otherwise, fully Bayes estimates of them
are obtained via Gibbs sampler and Metropolis-Hastings algorithm, under Jeffreys prior and uniform prior respectively.
}
\value{
  \item{Phi}{the empirical Bayes estimate of \var{phi} if \code{EB == TRUE}; or a vector of length \code{(iter/thin)}, the MCMC samples of \var{phi} if \code{EB == FALSE}. }
  \item{Sigmasq}{the empirical Bayes estimate of \var{sigma2} if \code{EB == TRUE}; or a vector of length \code{(iter/thin)}, the MCMC samples of \var{sigma2} if \code{EB == FALSE}. }
  \item{Alpha}{a vector of length \code{(iter/thin)}, the MCMC samples of \var{alpha} if \code{trend == TRUE}; or \code{0} if \code{trend == FALSE}. }
  \item{Mu}{a \code{(iter/thin)} * \code{(sum(eta)+1)} matrix.   
	Each row is a MCMC sample of \var{mu}.}
  \item{phi.est}{the empirical Bayes estimate of \var{phi} if \code{EB == TRUE}; or the posterior mean if \code{EB == FALSE}. }
  \item{sigmasq.est}{the empirical Bayes estimate of \var{sigma2} if \code{EB == TRUE}; or the posterior mean if \code{EB == FALSE}. }
  \item{alpha.est}{posterior mean estimate of \var{alpha}}
  \item{mu.est}{a vector of length \code{sum(eta)+1}, posterior mean estimate of \var{mu}}
  \item{X}{observed time series, same as the input value.}
  \item{meta}{metadata, same as the input value.}
  \item{input.parameters}{input parameters. Use command \code{names} to check
	its components.}
  \item{change.phi}{ratio of accepting a new phi in the MCMC chain, if \code{EB == FALSE}.}
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
Function \code{\link{cp.plot}} uses the output of this function as input.
}
\examples{
## Create a time series of length 200 with three mean shifts at 50, 100, 150.
data = simgen(2, 1);
X = data$X[1, ];  ## time series
meta = data$meta;  ## locations of metadata times

## Parameter estimation in the configuration where changepoints are time 50 and 99.
results = bcpmeta.parameters(X, meta = meta, eta = c(50, 99), trend = FALSE);  
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ package }
\keyword{ changepoint }
\keyword{ MCMC }
