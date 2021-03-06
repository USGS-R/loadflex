% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/loadInterp.R
\name{loadInterp}
\alias{loadInterp}
\title{Create a fitted loadInterp object.}
\usage{
loadInterp(interp.format = c("flux", "conc"),
  interp.function = linearInterpolation, data, metadata,
  retrans.function = NULL, store = c("data", "fitting.function",
  "uncertainty"))
}
\arguments{
\item{interp.format}{character. Which sort of observation should the
interpolations be done among?}

\item{interp.function}{function. The function to use for interpolation.
Pre-defined choices are described in \link{interpolations}; additional
functions may be defined by the user as long as they adhere to the
guidelines given there.}

\item{data}{data.frame. The data to be interpolated}

\item{metadata}{metadata, used to access the appropriate columns of data. At
a minimum, \code{metadata} should correctly specify the date column and the
column indicated by \code{interp.format}.}

\item{retrans.function}{irrelevant to loadInterp and must be NULL. for other
models, permits fitting in log or other transformed spaces.}

\item{store}{One or more character strings specifying which information to
write within the model. Options are 'data': the original fitting data;
'fitting.function': a fitting function that can produce a new loadComp
object from new data (this currently uses the same new data for both
regression calibration and interpolation); 'uncertainty': an estimate of
uncertainty, which can take some time to compute but will permit creation
of uncertainty intervals, etc. in the prediction and aggregation phases.}
}
\value{
A fitted loadInterp model.
}
\description{
Generates a new model of class loadInterp (\code{\link{loadInterp-class}})
which can iterpolate among observations of concentration or flux.
}
\details{
loadInterps are simple load models that predict concentration or flux based
on one or more preceding and following measurements of flux. The specific
interpolation method can be varied; examples include linear, spline, and
triangular interpolations. See \link{interpolations} for the full list of
pre-defined options; others may also be defined by the user.

loadInterps are currently assumed to have normally distributed residuals. An
unwitting user might violate this assumption without being caught by the
code, so be careful! This assumption is mainly relevant to the calculation of
confidence or prediction intervals. Also, where other models such as loadReg
and loadLm will retransform predictions back into linear space, loadInterps
will not.
}
\seealso{
Other load.model.inits: \code{\link{loadComp}},
  \code{\link{loadLm}}, \code{\link{loadModel}},
  \code{\link{loadReg2}}
}
\concept{load.model.inits}
