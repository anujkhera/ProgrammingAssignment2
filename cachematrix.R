# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    ## set the value of the matrix
    i<- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    ## get the value of the matrix
    get <- function() x
    
    ## set the inverse of the matrix
    setinverse <- function(solve) i <<- solve
    getinverse <- function() i
    
    ## get the inverse of the matrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    ## get the inverse of the matrix        
    i <- x$getinverse()
    
    ## check if there is the matrix   
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    ## if not: get the inverse of the matrix   
    data <- x$get()
    i <- solve(data, ...)
    ## set the inverse of the matrix 
    x$setinverse(i)
    i
}

x = rbind(c(1, -1/4), c(-1/4, 1))
m = makeCacheMatrix(x)
m$get()

cacheSolve(m)
# Modified by myself @local machine