## Put comments here that give an overall description of what your
## functions do

## The functions below does the computation and caching of the computed result

## Write a short comment describing this function

## The method below makeCacheMatrix takes a matrix as a parameter 
## It has four method inside it set(), get(), setinverse(), getinverse()

makeCacheMatrix <- function(x = matrix()) {
        
		m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)


}


## Write a short comment describing this function
## The method below cachSolve takes an object of makeCacheMatrix and tries to get the inverse by calling getinverse() method from 
## that object , if it doest not return null, it gets the result from cache else it calls the get() method of the object which returns a matrix
## and then use solve method of R to get the inverse of the matrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
