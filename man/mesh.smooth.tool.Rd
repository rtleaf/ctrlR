% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/mesh.smooth.tool.r
\name{mesh.smooth.tool}
\alias{mesh.smooth.tool}
\title{mesh.smooth.tool}
\usage{
mesh.smooth.tool(sur, algorithms = c("taubin", "angweight", "fujilaplace",
  "laplace", "hclaplace"), iter = 10, tarface = 10000, deltaFJ = NULL,
  deltaAW = NULL, lambda = NULL, tau = 0.01, lambda.levels = 5,
  deltaFJ.levels = 5, deltaAW.levels = 5, lambda.start = 0.95,
  deltaFJ.start = 0.95, deltaAW.start = 0.95, lambda.f = 0.99,
  deltaFJ.f = 0.99, deltaAW.f = 0.99, lambda.iter = 70,
  l.lambda.iter = 7, deltaFJ.iter = 70, l.deltaFJ.iter = 7,
  deltaAW.iter = 70, l.deltaAW.iter = 7, iter_scale_tau = 1,
  iter_scale_fuj = 1, iter_scale_ang = 1, noise = 0.075, sel = c(0, 1,
  3, 5, 6))
}
\arguments{
\item{sur}{triangular mesh stored as object of class "mesh3d"}

\item{algorithms}{character: algorithm types stored in Morpho::vcgSmooth}

\item{iter}{numeric: number of smoothing iterations (raccomended no more than 10 iteration)}

\item{tarface}{numeric: target of triangle number}

\item{deltaFJ}{numeric: setting values for deltaFJ (if NULL automatic estimation well be done)}

\item{deltaAW}{numeric: setting values for deltaAW (if NULL automatic estimation well be done)}

\item{lambda}{numeric: setting values for lambda (if NULL automatic estimation well be done)}

\item{tau}{numeric: mu value for "taubin" algorithm}

\item{lambda.levels}{numeric: length range lambda}

\item{deltaFJ.levels}{numeric: length range deltaFJ}

\item{deltaAW.levels}{numeric: length range deltaAW}

\item{lambda.start}{numeric: upper value lambda smoothing range}

\item{deltaFJ.start}{numeric: upper value deltaFJ smoothing range}

\item{deltaAW.start}{numeric: upper value deltaAW smoothing range}

\item{lambda.f}{numeric: factor for estimation lambda}

\item{deltaFJ.f}{numeric: factor for estimation deltaFJ}

\item{deltaAW.f}{numeric: factor for estimation deltaAW}

\item{lambda.iter}{numeric: iteration for lambda estimation}

\item{l.lambda.iter}{numeric: interval for lambda.iter}

\item{deltaFJ.iter}{numeric: iteration for deltaFJ estimation}

\item{l.deltaFJ.iter}{numeric: interval for deltaFJ estimation}

\item{deltaAW.iter}{numeric: iteration for deltaAW estimation}

\item{l.deltaAW.iter}{numeric: interval for deltaAW estimation}

\item{iter_scale_tau}{numeric: iter used in scale factor estimation for taubin algorithm}

\item{iter_scale_fuj}{numeric: iter used in scale factor estimation for fujilaplace algorithm}

\item{iter_scale_ang}{numeric: iter used in scale factor estimation for angweight algorithm}

\item{noise}{numeric: sd deviation to defin vertex shifting}

\item{sel}{numeric vector: nteger vector selecting cleaning type}
}
\value{
matrix matrix: matrix with all result (absolute sum of mesh distance) for smoothing setting iteration

noise.dist numeric: absolute sum of mesh distance between the model (or decimated mesh) and its noised version

tau.par numeric vector: lambda scale factor values

fuj.par numeric vector: deltaFJ scale factor values

ang.par numeric vector: deltaAW scale factor values
}
\description{
This function find the optimal smoothing algorithm setting giving a mesh using the mesh distance as estimator.
}
\examples{
\dontrun{
#load the example 1: mesh, and L set
data(exp.venus.mesh)
run.tool=mesh.smooth.tool(sur=venus.mesh,tarface=NULL,noise=0.075)
run.tool.dec= mesh.smooth.tool(sur=venus.mesh,tarface=NULL, noise=0.075,lambda=run.tool$tau.par,delta_AW=run.tool$ang.par)
}
}
\author{
Antonio Profico
}

