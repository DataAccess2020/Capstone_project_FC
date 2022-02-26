{NAME_OF_LIST} <- RCurl::getURL({URL}, 
                                httpheader = c(key))
cat({NAME_OF_LIST})

list1 <- fromJSON({NAME_OF_LIST})

list2 <- list1[[NNN]][[NNN]][[NNN]][[NNN]]

LIST_NAME <- as.data.frame(do.call(rbind, list2))