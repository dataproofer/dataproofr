#' Install dataproofer
#'
#' Install the underlying dataproofer npm package.
#'
#' @param force should the user be prompted to install?
#'
#' @return An installed lib
#' @export

dataproofer_install <- function(force = F) {
  if (!force) {
    message("Would you like to install the dataproofer Node library? Type 1 for yes and 0 for no.")
    consent <- readline(prompt = "Yes (1) or no (0)?: ")

    consent = ifelse(consent %in% c(1, "Yes", "YES", "yes", "Y", "y"), T, F)
    } else {
      consent = T
      }

  if (consent) {
    system("npm install -g dataproofer")
  }
  return(invisible(force))
}
