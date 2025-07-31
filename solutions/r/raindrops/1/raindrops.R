raindrops <- function(n) {
  result <- c(
    if (n %% 3 == 0) "Pling" else NULL,
    if (n %% 5 == 0) "Plang" else NULL,
    if (n %% 7 == 0) "Plong" else NULL
  )

  if (length(result) == 0) {
    return(as.character(n))
  } else {
    return(paste(result, collapse = ""))
  }
}
