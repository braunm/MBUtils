#' @name ptbl
#' @title convenience function to print tibbles.
#' @param x a tibble to be printed
#' @param n number of rows to be printed, or all (unquoted).
#' @param ... arguments to be passed to print.tbl_df
#' @details first, a default max rows is determined. Pretty much a wrapper to the standard tibble print function, but
#'   defaults to all rows and columns (but with a maximum).
#' @export
ptbl <- function(x, n=NULL, ...) {
 
  W <- enquo(n)
  pm <- getOption("tibble.print.max")

  if(is.numeric(n)) {
    M <- n
  } else {
    if(str_detect(as_label(W),"^[aA][lL]{2}$")) {
      M <- nrow(x)
    } else {
      if (!is.null(pm)) {
        M <- pm
      } else {
        M <- floor(nrow(x)/2)
      }
    }
  }
  print(x, n=M, ...)

}
