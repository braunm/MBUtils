.onLoad <- function(libname, pkgname) {

  ## Confirm knitr is already attached

  if ("knitr" %in% .packages(TRUE)) {

    ## knitr is attached

  } else {

    ## knitr is not attached

  }

  all_patterns$rlatex <- Rcode_pattern()


}
