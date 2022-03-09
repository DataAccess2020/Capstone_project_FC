cosp <- "https://api.propublica.org/congress/v1/117/bills/s"
cospy <- "https://api.propublica.org/congress/v1/117/bills/s1/cosponsor.json"

##maximum level 3706

bill_int <- "https://api.propublica.org/congress/v1/117/senate/bills/introduced.json"
bill_upd <- "https://api.propublica.org/congress/v1/117/senate/bills/updated.json"
bill_act <- "https://api.propublica.org/congress/v1/117/senate/bills/active.json"
bill_pas <- "https://api.propublica.org/congress/v1/117/senate/bills/passed.json"
bill_ena <- "https://api.propublica.org/congress/v1/117/senate/bills/enacted.json"
bill_vet <- "https://api.propublica.org/congress/v1/117/senate/bills/vetoed.json"

int2 <- RCurl::getURL(cospy, 
                      httpheader = c(key))
cat(int2)

list1 <- fromJSON(int2)
list1

list1[[5]][[1]][[11]]
list1[[5]][[1]][[23]]

int2 <- RCurl::getURL(cosp,
                      httpheader = c(key))
links1 <- as.data.frame(stri_paste(cosp,1:3706,"/cosponsors.json"))

i <- 1
for (i in 1:nrow(links1)){
  links1$key <- c("X-API-Key: im2M16KpfZDBpvstcbB100aYHgdobrB3M9MKSU2m")
}

i <- 1
for(i in 1:nrow(links1)){
  int1 <- as.list(RCurl::getURL(links1$`stri_paste(cosp, 1:3706, "/cosponsors.json")`, 
                                httpheader = c(links1$key)))
  Sys.sleep(2)
}
