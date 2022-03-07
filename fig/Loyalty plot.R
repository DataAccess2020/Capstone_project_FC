p <- ggplot(mean, aes(x = office, y = loyalty, color = party, label = name)) +
  geom_point() +
  scale_color_manual(values = c("blue", "green", "red")) +
  scale_y_discrete()

p

plot <- ggplotly(p)
plot

saveWidget(plot, file = "loyalty.html")
