# this is a stub function that takes a natural_number
# and should return the difference-of-squares as described
# in the README.md

square_of_sum <- function(n) {
  sum <- n * (n + 1) / 2
  sum * sum
}

sum_of_squares <- function(n) {
  (n * (n + 1) * (2*n + 1)) / 6
}

difference_of_squares <- function(n) {
  square_of_sum(n) - sum_of_squares(n)
}
