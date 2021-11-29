#' @name piv
#' @title shortcut for pivot_wider
#' @param data a tibble
#' @param names_from names_from
#' @param values_from values_from
#' @param values_fill values_fill
#' @param ... other arguments
#' @return a tibble
#' @export
pivw <- function(data, names, value, fill=NULL, ...) {
  pivot_wider(data, names_from=names, values_from=values, values_fill=fill, ...)
}

#' @rdname piv
#' @export
pivl <- function(data, names, values, ...) {
  pivot_longer(data, names_to=names, values_to=values, ...)
}
