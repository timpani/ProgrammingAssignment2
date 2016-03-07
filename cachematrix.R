## Usage: mat <- makeCacheMatrix(matrix)
##
## This can create an "matrix-like" object mat, which owns the property
## of matrix, but also cache the inverse matrix.
##
##
## Usage: cacheSolve(mat)
##
## Obtain the inverse of mat, if it has been calculated, just pop up the
## cache.


## Create an "matrix-like" object with cache
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Calculate the inverse matrix considering the cache.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  data <- x$get()
  m <- solve(data, ...)
  x$setsolve(m)
  
  m
  
}
