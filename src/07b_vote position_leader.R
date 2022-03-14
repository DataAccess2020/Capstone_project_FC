#Mitch McConnell
leaderR <- data_vote %>%
  filter(name == "Mitch McConnell")

date <- rep(c(1:526), each = 1)
leaderR$date <- date

offR = merge(data_vote, leaderR, by = "date")

#Chuck Schumer
leaderD <- data_vote %>%
  filter(name == "Charles E. Schumer")

date <- rep(c(1:526), each = 1)
leaderD$date <- date

offD = merge(data_vote, leaderD, by = "date")

#merge
mean_r <- ifelse(offR$vote_position.y == "Yes" & offR$vote_position.x == "Yes" & offR$party.x == "R", 0.5,
                     ifelse(offR$vote_position.y == "Yes" & offR$vote_position.x == "No" & offR$party.x == "R", 0,
                            ifelse(offR$vote_position.y == "Yes" & offR$vote_position.x == "Not Voting" & offR$party.x == "R", 0.25,
                                   ifelse(offR$vote_position.y == "No" & offR$vote_position.x == "Yes" & offR$party.x == "R", 1.5,
                                          ifelse(offR$vote_position.y == "No" & offR$vote_position.x == "No" & offR$party.x == "R", 0.5,
                                                 ifelse(offR$vote_position.y == "No" & offR$vote_position.x == "Not Voting" & offR$party.x == "R", 1,
                                                        ifelse(offR$vote_position.y == "Not Voting" & offR$vote_position.x == "Yes" & offR$party.x == "R", 1,
                                                               ifelse(offR$vote_position.y == "Not Voting" & offR$vote_position.x == "No" & offR$party.x == "R", 0.25, 
                                                                      ifelse(offR$vote_position.y == "Not Voting" & offR$vote_position.x == "Not Voting" & offR$party.x == "R", 0.5, NA)))))))))

mean_d <- ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Yes" & offD$party.x == "D", 1.5,
                 ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "No" & offD$party.x == "D", 2,
                        ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Not Voting" & offD$party.x == "D", 1.75,
                               ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Yes" & offD$party.x == "D", 0.5,
                                      ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "No" & offD$party.x == "D", 1.5,
                                             ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Not Voting" & offD$party.x == "D", 1,
                                                    ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Yes" & offD$party.x == "D", 1,
                                                           ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "No" & offD$party.x == "D", 1.75, 
                                                                  ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Not Voting" & offD$party.x == "D", 1.5, NA)))))))))

mean_id <- ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Yes" & offD$party.x == "ID", 1.5,
                 ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "No" & offD$party.x == "ID", 2,
                        ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Not Voting" & offD$party.x == "ID", 1.75,
                               ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Yes" & offD$party.x == "ID", 0.5,
                                      ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "No" & offD$party.x == "ID", 1.5,
                                             ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Not Voting" & offD$party.x == "ID", 1,
                                                    ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Yes" & offD$party.x == "ID", 1,
                                                           ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "No" & offD$party.x == "ID", 1.75, 
                                                                  ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Not Voting" & offD$party.x == "ID", 1.5, NA)))))))))


data_vote$mean_r <- mean_r
data_vote$mean_d <- mean_d
data_vote$mean_id <- mean_id

data_vote$merged[is.na(data_vote$mean_r)] <- data_vote$mean_d[is.na(data_vote$mean_r)]
data_vote$merged[is.na(data_vote$merged)] <- data_vote$mean_id[is.na(data_vote$merged)]

mean <- data.frame(summarise_at(group_by(data_vote, name),vars(merged),funs(mean(.,na.rm=TRUE))))

mean$office <-  assumed_office
mean$party <- as.character(sen_list$party)
mean$name <- as.character(mean$name)
mean$role <- ifelse(mean$name == "Mitch McConnell", "Leader", ifelse(mean$name == "Charles E. Schumer", "Leader", ifelse(mean$name == "John Thune", "Whip", ifelse(mean$name == "Richard J. Durbin", "Whip", ifelse(mean$name == "John Barrasso", "Conference Chair", ifelse(mean$name == "Patty Murray", "Conference Chair", "Senator"))))))
mean$role_v <- ifelse(mean$name == "Mitch McConnell", 3, ifelse(mean$name == "Charles E. Schumer", 3, ifelse(mean$name == "John Thune", 2, ifelse(mean$name == "Richard J. Durbin", 2, ifelse(mean$name == "John Barrasso", 1, ifelse(mean$name == "Patty Murray", 1, 0))))))

colnames(mean)[colnames(mean) == "merged"] = "loyalty"

#write.csv(mean, "data/mean.csv")
#mean <- subset(mean, select = -c(V1))
