votes <- "https://api.propublica.org/congress/v1/117/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:20,'.json'))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c(key)
}

i <- 1
for(i in 1:nrow(links1)){
  result <- as.data.frame(RCurl::getURL(links1$`stri_paste(votes, 1:20, ".json")`, 
                                        httpheader = c(links1$key)))
  Sys.sleep(1)
}

varnames <- ("api")

names(result)[1:ncol(result)]<- paste0(rep(varnames, each=1), "_",1)

votes_list <- list()

i <- 1
for (i in 1:20){
  vote_step <- fromJSON(result[[i,1]])
  votes_list[[length(votes_list)+1]] <- vote_step
}

i <- 1
for (i in 1:20){
  vote2 <- votes_list[[i]][[3]][[1]][[1]][["positions"]]
  sen_vote[[length(sen_vote)+1]] <- vote2
}

off_vote <- list()

i <- 1
for (i in 1:length(sen_vote)){
  list_step <- c(sen_vote[[i]])
  off_vote[[length(off_vote)+1]] <- list_step
}

all_vote <- list()

i <- 1
for (i in 1:length(sen_vote)){
  off_step <- as.data.frame(do.call(rbind, sen_vote[[i]]))
  all_vote[[length(all_vote)+1]] <- off_step
}

data_vote <- as.data.frame(do.call(rbind, all_vote))
