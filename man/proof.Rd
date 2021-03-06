% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/proof.R
\name{proof}
\alias{proof}
\title{Proof tabular data}
\usage{
proof(
  data,
  suite = "all",
  tests = "none",
  out = FALSE,
  out_format = "json",
  summary = FALSE,
  verbose = FALSE,
  exclude = FALSE
)
}
\arguments{
\item{data}{Tibble or dataframe to test.}

\item{suite}{Which suite of tests do you want to perform? Defaults to "all", other options include "core", "info", "stats" and "geo".}

\item{tests}{Which individual tests do you want to perform?}

\item{out}{Export the results to a json file. Specify a path to export.}

\item{out_format}{Choose between "json" (default) and "json-pretty".}

\item{summary}{Exclude tests that passed.}

\item{verbose}{Include descriptions about each column.}
}
\description{
Specify a tibble or dataframe and perform automated data proofing tests.
}
\examples{
proof(mtcars)

proof(iris,
      tests = c("duplicate rows", "empty cells"),
      out = "results.json", out_format = "json-pretty")

proof(PlantGrowth, suite = "stats", verbose = TRUE)
}
