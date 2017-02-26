##R implementation of yes prints passed in string
##or 'y' (default) on new lines indefinitely.
##Call with yes() or yes("[input]") and hit escape 
##key to stop program execution.
yes <- function(output="y"){
  while(TRUE){
    cat(paste(output, "\n", ""))
  }
}
