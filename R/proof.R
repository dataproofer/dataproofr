#' Proof tabular data
#'
#' Specify a tibble or dataframe and perform automated data proofing tests.
#'
#' @param data Tibble or dataframe to test.
#'
#' @param suite Which suite of tests do you want to perform? Defaults to "all", other options include "core", "info", "stats" and "geo".
#'
#' @param tests Which individual tests do you want to perform?
#'
#' @param out Export the results to a json file. Specify a path to export.
#'
#' @param out_format Choose between "json" (default) and "json-pretty".
#'
#' @param summary Output overall test results, excluding pass/fail results.
#'
#' @param verbose Include descriptions about each column.
#'
#' @param summary Exclude tests that passed.
#'
#' @importFrom utils write.csv
#'
#' @export
#'
#' @examples
#' proof(mtcars)
#'
#' proof(iris, tests = c("duplicate rows", "empty cells"), out = "results.json", out_format = "json-pretty")
#'
#' proof(PlantGrowth, suite = "stats", verbose = TRUE)

proof <- function(data, suite = "all", tests = "none", out = FALSE, out_format = "json", summary = FALSE, verbose = FALSE, exclude = FALSE) {
  write.csv(data, file = paste0(tempdir(), "/", deparse(substitute(data)), ".csv"), row.names = F)
  arguments <- paste0(
    "dataproofer ",
    tempdir(), "/", deparse(substitute(data)), ".csv",
    if (length(suite) > 1) paste(paste0(" --", suite), collapse = "") else {if (suite != "all") paste0( " --", suite)},
    if (paste0(tests, collapse = "") != "none") paste(' --tests "', paste(tests, collapse = ","), '"', sep = ""),
    if (out != F) paste0(" --out ", out, " --", out_format),
    if (summary) " --summary",
    if (verbose) " --verbose",
    if (exclude) " --exclude"
  )
  system(arguments)
}
