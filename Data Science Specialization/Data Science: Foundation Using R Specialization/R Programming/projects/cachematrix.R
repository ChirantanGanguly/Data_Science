# The Following two functions cache the inverse of a matrix

# Creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  ## Initializing the inverse property
  m <- NULL
  
  # Method to set the matrix
  set <- function(matrix) {
    x <<- matrix
    m <<- NULL
  }
  
  # Method the get the matrix
  get <- function() x
  
  # Method to set the inverse of the matrix
  setinv <- function(inverse) m <<- inverse
  
  # Method to get the inverse of the matrix
  getinv <- function() m
  
  # Return a list of the methods
  list(set = set, get = get,setinv = setinv, getinv = getinv)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"
## above. If the inverse has already been calculated (and the matrix has not
## changed), then the "cachesolve" should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  
  #If the matrix is already set then return without computing again
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  
  # Gets the matrix from our object
  data <- x$get()
  
  # Calculate the inverse using solve()
  i<-solve(data)
  
  # Set the inverse to the object
  x$setinv(i)
  
  # Return the inverted matrix
  i
}
