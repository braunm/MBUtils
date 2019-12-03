#' @name rcode_pattern
#' @title Definition of the rcode pattern
#' @details A named list defining the rcode pattern.
#' @export
Rcode_pattern <- list(
  chunk.begin = "^\\s*\\\\begin\\{[Rr]code\\}(?:\\[(.*)?\\])?\\s*(%+.*|)$",
  chunk.end = "^\\s*\\\\end\\{[Rr]code\\}\\s*(%+.*|)$",
  inline.code = "\\\\Sexpr\\{([^}]+)\\}",
  inline.comment = "^\\s*%.*",
  header.begin = "(^|\n)\\s*\\\\documentclass[^}]+\\}",
  document.begin = "\\s*\\\\begin\\{document\\}",
  ref.chunk = "^\\s*\\\\RcodeChunk\\{(.+)\\}.*$"
)

#' @name rmd_pattern
#' @title Definition of the Rmd pattern
#' @details A named list defining the rmd pattern
#' @export
Rmd_pattern <- list(
  chunk.begin = "^[\t >]*```+\\s*\\{([a-zA-Z0-9_]+( *[ ,].*)?)\\}\\s*$",
  chunk.end = "^[\t >]*```+\\s*$",
  ref.chunk = "^\\s*<<(.+)>>\\s*$",
  inline.code = "(?<!(^|\n)``)`r[ #]([^`]+)\\s*`"
)


#' @rdname rcode_pattern
#' @title Functions to set the rcode pattern before knitting or rendering.
#' @details Sets the pattern to the Rcode default pattern, using the
#'   same mechanism as knitr. When you run this, you will not be able
#'   to knit or render other documents without setting the pattern, or
#'   clearing using knit_patterns$restore().
#' This will work with Rnw files.  So, to compile an Rnw file with
#'   Rcode blocks, run pat_rcode() first.  To switch back to Sweave
#'   syntax (or really, any other syntax), run
#'   knit_patterns$restore(), and let knitr figure it out. Or, run
#'   pat_zzz(), where zzz is an extension for the various convenience
#'   functions provided by knitr.
#' @export
pat_rcode <- function() {
  knit_patterns$restore(Rcode_pattern)
}
#' @rdname rmd_pattern
#' @export
pat_rmd <- function() {
  knit_patterns$restore(Rmd_pattern)
}

#' @export pat_rlatex pat_Rcode
#' @rdname rcode_pattern
pat_rlatex <- pat_rcode
#' @rdname rcode_pattern
pat_Rcode <- pat_rcode

#' @export pat_Rmd
#' @rdname rmd_pattern
pat_Rmd <- pat_rmd


