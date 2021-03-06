\name{asyCov}
\alias{asyCov}
\title{Compute Asymptotic Covariance Matrix of a Correlation/Covariance Matrix
}
\description{It computes the asymptotic sampling covariance matrix of a
  correlation/covariance matrix under the assumption of multivariate normality. 
}
\usage{
asyCov(x, n, cor.analysis = TRUE, dropNA = FALSE, as.matrix = TRUE,
       acov=c("individual", "unweighted", "weighted"),
       suppressWarnings = TRUE,  silent = TRUE, run = TRUE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A correlation/covariance matrix or a list of
	correlation/covariance matrices. \code{NA} on the variables or other
	values defined in \code{na.strings} will be removed before the
	analysis. Note that it only checks the diagonal elements of
	the matrices. If there are missing values, make sure that the
	diagonals are coded with \code{NA} or values defined in \code{na.strings}.
}
  \item{n}{Sample size or a vector of sample sizes}
  \item{cor.analysis}{Logical. The output is either a correlation or
	covariance matrix.}
  \item{dropNA}{Logical. If it is \code{TRUE}, the resultant dimensions
	will be reduced by dropping the missing variables. If it is
	\code{FALSE}, the resultant dimensions are the same as the input by
	keeping the missing variables. }
  \item{as.matrix}{Logical. If it is \code{TRUE} and \code{x} is a list of correlation/covariance
	matrices with the same dimensions, the asymptotic covariance
	matrices will be column vectorized and stacked together. If it is
	\code{FALSE}, the output will be a list of asymptotic covariance
	matrices. Note that if it is \code{TRUE}, \code{dropNA} will be
	\code{FALSE} automatically. This option is useful when passing the
	asymptotic covariance matrices to \code{\link[metaSEM]{meta}} }
  \item{acov}{If it is \code{individual} (the default), the sampling variance-covariance
	matrices are calculated based on the individual correlation/covariance
	matrix. If it is either \code{unweighted} or \code{weighted}, the average
	correlation/covariance matrix is calculated based on the unweighted
	or weighted mean with the sample sizes. The average
	correlation/covariance matrix is used to calculate the sampling
	variance-covariance matrices.}
  \item{suppressWarnings}{Logical. If \code{TRUE}, warnings are
	suppressed. It is passed to \code{\link[OpenMx]{mxRun}}.}
  \item{silent}{Logical. An argument to be passed to \code{\link[OpenMx]{mxRun}}}
  \item{run}{Logical. If \code{FALSE}, only return the mx model without
	running the analysis.}
  \item{\dots}{Further arguments to be passed to \code{\link[OpenMx]{mxRun}}}
}

\value{An asymptotic covariance matrix of the vectorized
  correlation/covariance matrix or a list of these matrices. If
  \code{as.matrix}=\code{TRUE} and \code{x} is a list of matrices, the output
  is a stacked matrix. }
\references{
Cheung, M. W.-L., & Chan, W. (2004). Testing dependent correlation coefficients via structural equation modeling. \emph{Organizational Research Methods}, \bold{7}, 206-223. 
}
\author{Mike W.-L. Cheung <mikewlcheung@nus.edu.sg>
}


\examples{
\dontrun{
C1 <- matrix(c(1,0.5,0.4,0.5,1,0.2,0.4,0.2,1), ncol=3)  
asyCov(C1, n=100)

## Data with missing values
C2 <- matrix(c(1,0.4,NA,0.4,1,NA,NA,NA,NA), ncol=3)  
C3 <- matrix(c(1,0.2,0.2,1), ncol=2)

## Output is a list of asymptotic covariance matrices
asyCov(list(C1,C2,C3), n=c(100,50,50), dropNA=TRUE, as.matrix=FALSE)

## Output is a stacked matrix of asymptotic covariance matrices
asyCov(list(C1,C2), n=c(100,50), as.matrix=TRUE)

## Output is a stacked matrix of asymptotic covariance matrices
asyCov(list(C3,C3), n=c(100,50), as.matrix=TRUE)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ meta-analysis }
