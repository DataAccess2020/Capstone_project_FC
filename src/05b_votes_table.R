votes <- "https://api.propublica.org/congress/v1/117/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:5,".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c(key)
}

i <- 1
for(i in 1:nrow(links1)){
  result <- RCurl::getURL(links1$`stri_paste(votes, 1:5, ".json")`, 
                                        httpheader = c(links1$key))
  Sys.sleep(1)
}

cat(result)

votes_list <- list()

i <- 1

for (i in 1:5){
 votes_list <- append(votes_list, fromJSON(result[i]))
}

c <- votes_list[[6]][[1]][[1]][[24]]
d <- as.data.frame(rbind, c)

sen_list <- data.frame()
index <- c(3, 6, 9, 12, 15)

i <- 1
x <- 1
for(x in 1:4){
  c <- votes_list[[index[x]]][[1]][[1]][[24]]
  for(i in 1:length(c)){
    dat <- data.frame(matrix(unlist(c[[i]]), nrow = length(c[[i]]), byrow = FALSE))
    sen_list <- rbind(sen_list, t(dat))
}
}










c <- votes_list[[3]][[1]][[1]][[24]]









b <- fromJSON(result)

c <- b[[3]][[1]][[1]][[24]]



object.size(a)




























links1 <- as.data.frame(stri_paste(votes,1:5,".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c("X-API-Key:")
}

i <- 1
for(i in 1:nrow(links1)){
  result <- RCurl::getURL(links1$`stri_paste(votes, 1:5, ".json")`, 
                          httpheader = c(links1$key))
  Sys.sleep(1)
}

print(result)


i <- 1
for(i in 1:nrow(int1)){
  int2 <- as.tibble(int1[c(1:5, 1:1)])
}


a <- fromJSON(int1[1, ])

vote_117 <- as.list(do.call(rbind, int1))



vote1 <- as.data.frame(do.call(rbind, a))

sen_list <- as.data.frame(do.call(rbind, list3))