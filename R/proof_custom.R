#' Proof tabular data
#'
#' Proof tabular data.
#'
#' @param data Tibble or dataframe to test.
#'
#' @param row.names Do you want to include row names in your analysis? Defaults to `FALSE`.
#'
#' @param options Pass on arguments directly to the Node package.
#'
#' @importFrom utils write.csv
#'
#' @export
#'
#' @examples
#'
#' proof_custom(iris, options = "--core --summary")

proof_custom <- function(data, options = "") {
  write.csv(data, row.names = FALSE, file = paste0(tempdir(), "/", deparse(substitute(data)), ".csv"), row.names = row.names)

  system(paste0("dataproofer ", tempdir(), "/", deparse(substitute(data)), ".csv ", options))
}
