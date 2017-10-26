##R implementation of yes prints passed in string
##or 'y' (default) on new lines indefinitely.

##########################
# How to execute
#
# option 1 - output 'yes'
# yes()
# 
# option 2 - output argument list
# yes([argument_list])

yes <- function(output="y"){
  while(TRUE){
    cat(paste(output, "\n", ""))
  }
}
