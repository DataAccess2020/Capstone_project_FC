network <- graph_from_data_frame(d = count, directed = F)

V(network)$colour <- NA

V(network)$colour <- ifelse(V(network)$cosponsor == "Hawley", "red", "blue")
                            
deg <- degree(network, mode = "all")

plot(network, vertex.size=1, vertex.color=rgb(0.1,0.7,0.8,0.5))

tg <- tidygraph::as_tbl_graph(network) %>% 
  tidygraph::activate(nodes) %>% 
  dplyr::mutate(label=name)

set.seed(12345)

tg %>%
  ggraph(layout = "fr") +
  geom_edge_arc(colour= "gray50",
                lineend = "round",
                strength = .1,
                alpha = .1) +
  geom_node_text(aes(label = name), 
                 repel = TRUE, 
                 point.padding = unit(0.2, "lines"), 
                 colour="gray10") +
  theme_graph(background = "white") +
  guides(edge_width = FALSE,
         edge_alpha = FALSE) +
  labs(title = "max.overlaps = 100")

plot(network, 
  frame = F,
  vertex.size = 7, 
  vertex.label = NA,
  vertex.label.cex = .7,
  edge.arrow.size = .05,
  edge.width = .3,
  edge.curved=0.3)
dev.off()

senator <- as.character(sen_list$last_name)

# Create a graph object with igraph
mygraph <- graph_from_data_frame(d = count)

# Make the graph
ggraph(mygraph, layout="fr") + 
  #geom_edge_density(edge_fill="#69b3a2") +
  geom_edge_link(edge_colour="black", edge_alpha=0.2, edge_width=0.3) +
  geom_node_point() +
  theme_void() +
  theme(
    legend.position="none",
    plot.margin=unit(rep(1,4), "cm")
  ) 
