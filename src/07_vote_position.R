View(data_vote)

data_vote <- data_vote[-c(1:198), ]

data_vote$value <- ifelse(data_vote$vote_position == "Yes", 1, ifelse(data_vote$vote_position == "No", 0, NA))

mean <- within(data_vote, {new = ave(value, name, FUN= function(x) mean(x, na.rm=TRUE))})
mean <- data.frame(summarise_at(group_by(data_vote, name),vars(value),funs(mean(.,na.rm=TRUE))))

date1 <- rep(c(1:526), each = 100)

data_vote$date <- date1

assumed_office <- c(2013, 2007, 2009, 2019, 2011, 2011, 2013, 2011, 2019, 2007, 2005, 2001, 2015, 2007, 2001, 2007, 2015, 1997, 2010, 2002, 2017, 2015, 2019, 1999, 2013, 2015, 2017, 1997, 2015, 1992, 2013, 2009, 2003, 1981, 2021, 2017, 2019, 2013, 2021, 2013, 2011, 2018, 1994, 2011, 2013, 2020, 2017, 2013, 2007, 2015, 1975, 2011, 2021, 2021, 2010, 2013, 2021, 1985, 2006, 2009, 2011, 2002, 2013, 1993, 2021, 2021, 2011, 2015, 2011, 1997, 2009, 2019, 2019, 2015, 2011, 2007, 2015, 2012, 1999, 2019, 2013, 2009, 1987, 2019, 2018, 2001, 2015, 2007, 2005, 2015, 2011, 2021, 2017, 2009, 2021, 2013, 2007, 2007, 1996, 2017)

data_vote$period <- ifelse(data_vote$date <= 3, 1, ifelse(data_vote$date <= 6, 2, ifelse(data_vote$date <= 9, 3, 4)))

mean <- within(data_vote, {new = ave(value, name, period, FUN = function(x) mean(x, na.rm=TRUE))})

mean_period <- summarise_at(group_by(data_vote, name, period),vars(value),funs(mean(.,na.rm=TRUE)))

mean$office <- assumed_office

mean$party <- as.character(sen_list$party)



p <- ggplot(mean, aes(x = office, y = value, color = party, label = name)) +
  geom_point(aes(shape = role, size = role_v))

p

plot <- ggplotly(p)
plot

saveWidget(plot, file = "plot.html")
