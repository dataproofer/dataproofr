#' Proof tabular data
#'
#' Specify a tibble or dataframe and perform automated data proofing tests.
#'
#' @param data Tibble or dataframe to test.
#'
#' @param tests Which tests do you want to perform? Defaults to "all", other options include "core", "info", "stats" and "geo".
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

proof <- function(data, tests = "all", out = F, out_format = "json", summary = F, verbose = F, exclude = F) {

  write.csv(data, file = paste0(tempdir(), "/dataproofr_export.csv"), row.names = F)

  system(
    paste0(
      "dataproofer ", tempdir(), "/dataproofr_export.csv",
      ifelse(tests != "all", paste0(" --", tests), ""),
      ifelse(out != F, paste0(" --out ", out, " --", out_format), ""),
      ifelse(summary, " --summary", ""),
      ifelse(verbose, " --verbose", ""),
      ifelse(exclude, " --exclude", "")
      )
    )
}
