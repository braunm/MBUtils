#' @name Rcode-pattern
#' A named list
#' @export
Rcode_pattern_default <- list(
  chunk.begin = "^\\s*\\\\begin\\{Rcode\\}\\[(.*)?\\].*$",
  chunk.end = "^\\s*\\\\end\\{Rcode\\}\\s*(%+.*|)$",
  inline.code = "\\\\Sexpr\\{([^}]+)\\}",
  inline.comment = "^\\s*%.*",
  header.begin = "(^|\n)\\s*\\\\documentclass[^}]+\\}",
  document.begin = "\\s*\\\\begin\\{document\\}",
  ref.chunk = "^\\s*\\\\RcodeChunk\\{(.+)\\}.*$"
)

#' @rdname Rcode-pattern
#' @param pattern.list A named list with regex patterns for each
#'   element.
#' @details The patterns to be included in the list are chunk.begin,
#'   chunk.end, inline.code, inline.comment, header.begin,
#'   document.begin, and ref.chunk.
#' @export
Rcode_pattern <- function(pattern.list=Rcode_pattern_default) {

  knit_patterns$set(pattern.list)

}
