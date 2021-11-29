#' @name piv
#' @title shortcut for pivot_wider
#' @param data a tibble
#' @param names names_from
#' @param values values_from
#' @param fill values_fill
#' @param ... other arguments
#' @return a tibble
#' @export
pivw <- function(data, names, values, fill=NULL, ...) {
  tidyr::pivot_wider(data, names_from=names, values_from=values, values_fill=fill, ...)
}

#' @rdname piv
#' @export
pivl <- function(data, names, values, ...) {
  tidyr::pivot_longer(data, names_to=names, values_to=values, ...)
}
