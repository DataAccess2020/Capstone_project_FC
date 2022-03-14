p <- ggplot(mean, aes(x = office, y = loyalty, color = party, label = name)) +
  geom_point() +
  scale_color_manual(values = c("blue", "green", "red")) +
  scale_y_discrete()

plot <- ggplotly(p)
plot

saveWidget(plot, file = "loyalty.html")
