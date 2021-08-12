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

proof_custom <- function(data, options = "") {
  write.csv(data, file = paste0(tempdir(), "/dataproofr_export.csv"), row.names = F)

  system(paste0("dataproofer ", tempdir(), "/dataproofr_export.csv ", options))
}
