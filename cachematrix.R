## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# This function will save a matrix and transfare it to a square matrix and calculate it's solve

makeCacheMatrix <- function(x = matrix()) {
num <-  sqrt(nrow(x))
  x <- matrix(x, ncol = num, nrow = num)
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
## Write a short comment describing this function
# This function will get the solve of the matrix if it is exsist, if not willcalculate the solve for it
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
 s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
