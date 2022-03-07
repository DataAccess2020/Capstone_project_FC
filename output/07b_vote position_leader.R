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

mean_d <- ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Yes" & offD$party.x == "D" | offD$party.x == "ID", 1.5,
                 ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "No" & offD$party.x == "D" | offD$party.x == "ID", 2,
                        ifelse(offD$vote_position.y == "Yes" & offD$vote_position.x == "Not Voting" & offD$party.x == "D" | offD$party.x == "ID", 1.75,
                               ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Yes" & offD$party.x == "D" | offD$party.x == "ID", 0.5,
                                      ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "No" & offD$party.x == "D" | offD$party.x == "ID", 1.5,
                                             ifelse(offD$vote_position.y == "No" & offD$vote_position.x == "Not Voting" & offD$party.x == "D" | offD$party.x == "ID", 1,
                                                    ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Yes" & offD$party.x == "D" | offD$party.x == "I", 1,
                                                           ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "No" & offD$party.x == "D" | offD$party.x == "ID", 1.75, 
                                                                  ifelse(offD$vote_position.y == "Not Voting" & offD$vote_position.x == "Not Voting" & offD$party.x == "D" | offD$party.x == "ID", 1.5, NA)))))))))

data_vote$mean_r <- mean_r
data_vote$mean_d <- mean_d

data_vote$merged[is.na(data_vote$mean_r)] <- data_vote$mean_d[is.na(data_vote$mean_r)]

mean <- data.frame(summarise_at(group_by(data_vote, name),vars(merged),funs(mean(.,na.rm=TRUE))))

mean$office <-  assumed_office
mean$party <- as.character(sen_list$party)

colnames(mean)[colnames(mean) == "merged"] = "loyalty"

p <- ggplot(mean, aes(x = office, y = loyalty, color = party, label = name)) +
  geom_point() +
  scale_color_manual(values = c("blue", "green", "red")) +
  scale_y_discrete()

p

plot <- ggplotly(p)
plot

saveWidget(plot, file = "plot.html")

