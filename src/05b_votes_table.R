votes <- "https://api.propublica.org/congress/v1/117/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:3,".json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c(key)
}

result <- list()

i <- 1
for(i in 1:nrow(links1)){
  result <- as.list(RCurl::getURL(links1$`stri_paste(votes, 1:3, ".json")`, 
                                        httpheader = c(links1$key)))
  Sys.sleep(1)
}

##since there everything is ok, but after i think that i can't do anything

votes_list <- list()

voting <- as.data.frame(stri_paste("vote",1:9))

i <- 1
for (i in 1:length(result)){
  votes_list <- c(votes_list, fromJSON(result[i, 1]))
}

?c

i <- 1
for (i in 1:3){
  new_value <- c(fromJSON(result[[i]]))
}

votes_list <- 


sen_list <- data.frame()
index <- seq(3,9, by = 3)
index

i <- 1
x <- 1
for(x in 1:9){
  c <- votes_list[[index[x]]][[1]][[1]][[24]]
  for(i in 1:length(c)){
    dat <- data.frame(matrix(unlist(c[[i]]), nrow = length(c[[i]]), byrow = FALSE))
    sen_list <- rbind(sen_list, t(dat))
}
}

c

i <- 1
x <- 3
for(x in index){
  c <- votes_list[[x]][[1]][[1]][[24]]
  for(i in 1:length(c)){
    dat <- as.list(matrix(unlist(c[[i]]), nrow = length(c[[i]]), byrow = FALSE))
    sen_list <- as.data.frame(do.call(rbind, t(dat)))
  }
}





c <- votes_list[[6]][[1]][[1]][[24]]
d <- as.data.frame(rbind, c)
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