#' Check npm and Node status
#'
#' Are npm and Node available on this device?
#'
#' @param force should the user be prompted to install?
#'
#' @return Warning if not available, message if available.
#' @export

node_available <- function(){
  # check npm availability
  test <- suppressWarnings(
    system(
      "npm -v",
      ignore.stdout = TRUE,
      ignore.stderr = TRUE
    )
  )

  if (test != 0) {
    warning("Please install npm.")
  } else {
    message("npm successfully detected.")
  }

  # check Node.js availability
  test <- suppressWarnings(
    system(
      "node -v",
      ignore.stdout = TRUE,
      ignore.stderr = TRUE
    )
  )

  if (test != 0) {
    warning("Please install Node.js.")
  } else {
    message("Node.js successfully detected.")
  }
}
