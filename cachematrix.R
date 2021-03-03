## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  #Creates a special "matrix" object that can cache its inverse
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x #Get value of matrix 
  setsolve <- function() s <<- solve(x) # calculate solve 
  getsolve <- function() s # Get value of solve
  list(set = set, 
       get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  ## Computes a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if (!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  my_mat <- x$get()
  s <- solve(my_mat, ...)
  x$setsolve(s)
  s
}


