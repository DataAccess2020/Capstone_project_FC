votes <- "https://api.propublica.org/congress/v1/116/senate/sessions/1/votes/1.json"

links1 <- as.data.frame(stri_paste(votes,1:5,".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c(key)
}

i <- 1
for(i in 1:nrow(links1)){
  result <- as.data.frame(RCurl::getURL(links1$`stri_paste(votes, 1:50, ".json")`, 
                                            httpheader = c(links1$key)))
  Sys.sleep(1)
}

fromJSON(paste(readLines(result), collapse = ""))

i <- 1
for(i in 1:nrow(links1)){
  result <- as.list(RCurl::getURL(links1$`stri_paste(votes, 1:5, ".json")`, 
                                            httpheader = c(links1$key)))
  Sys.sleep(1)
}

result[[2]]

print(result)


i <- 1
for(i in 1:nrow(int1)){
  int2 <- as.tibble(int1[c(1:5, 1:1)])
}


a <- fromJSON(result[[1]])

vote_117 <- as.list(do.call(rbind, int1))



vote1 <- as.data.frame(do.call(rbind, a))

sen_list <- as.data.frame(do.call(rbind, list3))