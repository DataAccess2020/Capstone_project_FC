View(data_vote)

data_vote$value <- ifelse(data_vote$vote_position == "Yes", 1, ifelse(data_vote$vote_position == "No", 0, 2))
