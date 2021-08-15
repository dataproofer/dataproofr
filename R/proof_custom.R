#' Proof tabular data
#'
#' Proof tabular data.
#'
#' @param data Tibble or dataframe to test.
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
  write.csv(data, file = paste0(tempdir(), "/", deparse(substitute(data)), ".csv"), row.names = F)

  system(paste0("dataproofer ", tempdir(), "/", deparse(substitute(data)), ".csv ", options))
}
