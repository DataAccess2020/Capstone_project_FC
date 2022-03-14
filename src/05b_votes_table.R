votes <- "https://api.propublica.org/congress/v1/117/senate/sessions/1/votes/"

links1 <- as.data.frame(stri_paste(votes,1:528,'.json'))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c(key)
}

i <- 1
for(i in 1:nrow(links1)){
  result <- as.data.frame(RCurl::getURL(links1$`stri_paste(votes, 1:528, ".json")`, 
                                        httpheader = c(links1$key)))
  Sys.sleep(1)
}

result <- fromJSON("result.json")

votes_list <- list()

i <- 1
for (i in 1:528){
  vote_step <- fromJSON(result[[i]])
  votes_list[[length(votes_list)+1]] <- vote_step
}

sen_vote <- list()

i <- 1
for (i in 1:528){
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

data_vote <- data_vote[-c(1:198), ]

date1 <- rep(c(1:526), each = 100)

data_vote$date <- date1

assumed_office <- c(2013, 2007, 2009, 2019, 2011, 2011, 2013, 2011, 2019, 2007, 2005, 2001, 2015, 2007, 2001, 2007, 2015, 1997, 2010, 2002, 2017, 2015, 2019, 1999, 2013, 2015, 2017, 1997, 2015, 1992, 2013, 2009, 2003, 1981, 2021, 2017, 2019, 2013, 2021, 2013, 2011, 2018, 1994, 2011, 2013, 2020, 2017, 2013, 2007, 2015, 1975, 2011, 2021, 2021, 2010, 2013, 2021, 1985, 2006, 2009, 2011, 2002, 2013, 1993, 2021, 2021, 2011, 2015, 2011, 1997, 2009, 2019, 2019, 2015, 2011, 2007, 2015, 2012, 1999, 2019, 2013, 2009, 1987, 2019, 2018, 2001, 2015, 2007, 2005, 2015, 2011, 2021, 2017, 2009, 2021, 2013, 2007, 2007, 1996, 2017)

#extract questions text
title_step2 <- list()

i <- 1
for (i in 1:528){
  title_step1 <- votes_list[[i]][[3]][[1]][[1]][["question_text"]]
  title_step2[[length(title_step2)+1]] <- title_step1
}

title_step4 <- list()

i <- 1
for (i in 1:length(title_step2)){
  title_step3 <- c(title_step2[[i]])
  title_step4[[length(title_step4)+1]] <- title_step3
}

data_title <- as.data.frame(do.call(rbind, title_step4))

#extract date
date_step2 <- list()

i <- 1
for (i in 1:528){
  date_step1 <- votes_list[[i]][[3]][[1]][[1]][["date"]]
  date_step2[[length(date_step2)+1]] <- date_step1
}

date_step4 <- list()

i <- 1
for (i in 1:length(date_step2)){
  date_step3 <- c(date_step2[[i]])
  date_step4[[length(date_step4)+1]] <- date_step3
}

data_date <- as.data.frame(do.call(rbind, date_step4))

data_title$date <- data_date

data_title <- data_title[-c(1:2), ]

data1 <- rbind(data_vote, data_title)
