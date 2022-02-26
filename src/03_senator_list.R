list_sen <- RCurl::getURL(senator, 
                          httpheader = c(key))
cat(list_sen)

list1 <- fromJSON(list_sen)

list2 <- list1[[3]][[1]]
list3 <- list2[[5]]

sen_list <- as.data.frame(do.call(rbind, list3))