votes <- "https://api.propublica.org/congress/v1/117/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:132, ".json"))
links2 <- as.data.frame(stri_paste(votes,133:264, ".json"))
links3 <- as.data.frame(stri_paste(votes,265:396, ".json"))
links4 <- as.data.frame(stri_paste(votes,397:528, ".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for (i in 1:nrow(links2)){
  links2$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for (i in 1:nrow(links3)){
  links3$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for (i in 1:nrow(links4)){
  links4$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for(i in 1:nrow(links1)){
  int1 <- as.list(RCurl::getURL(links1$`stri_paste(votes, 1:132, ".json")`, 
                                httpheader = c(links1$key)))
  Sys.sleep(2)
}

i <- 1
for(i in 1:nrow(links2)){
  int2 <- as.list(RCurl::getURL(links2$`stri_paste(votes, 133:264, ".json")`, 
                                httpheader = c(links2$key)))
  Sys.sleep(2)
}

i <- 1
for(i in 1:nrow(links3)){
  int3 <- as.list(RCurl::getURL(links3$`stri_paste(votes, 265:396, ".json")`, 
                                httpheader = c(links3$key)))
  Sys.sleep(2)
}

i <- 1
for(i in 1:nrow(links4)){
  int4 <- as.list(RCurl::getURL(links4$`stri_paste(votes, 397:528, ".json")`, 
                                httpheader = c(links4$key)))
  Sys.sleep(2)
}

vote_117 <- as.data.frame(do.call(rbind, int1))

is.list(pages)

