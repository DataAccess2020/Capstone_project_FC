votes <- "https://api.propublica.org/congress/v1/116/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:5, ".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for(i in 1:nrow(links1)){
  int1 <- as.data.frame(RCurl::getURL(links1$`stri_paste(votes, 1:5, ".json")`, 
                                      httpheader = c(links1$key)))
  Sys.sleep(2)
}

i <- 1
for(i in 1:nrow(int1)){
  int2 <- as.tibble(int1[c(1:5, 1:1)])
}


a <- fromJSON(int1[1, ])

vote_117 <- as.list(do.call(rbind, int1))



vote1 <- as.data.frame(do.call(rbind, a))

sen_list <- as.data.frame(do.call(rbind, list3))