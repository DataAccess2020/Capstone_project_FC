list_sen <- RCurl::getURL(senator, 
                          httpheader = c(key))
cat(list_sen)

list1 <- fromJSON(list_sen)

list2 <- list1[[3]][[5]][[1]]

sen_list1 <- as.data.frame(do.call(rbind, list2))

sen_list = as.data.frame(t(sen_list1))

sen_list <- sen_list[-c(36,54), ]

sen_list
