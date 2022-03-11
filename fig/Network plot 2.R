network <- simpleNetwork(count, height="100px", width="100px",        
                   Source = 1,                 
                   Target = 2,                 
                   linkDistance = 10000,          
                   charge = -90,                
                   fontSize = 100,               
                   fontFamily = "serif",       
                   linkColour = "#666",        
                   nodeColour = "red",     
                   opacity = 1,              
                   zoom = T                   
)

saveWidget(network, file = "network.html")

count2 = (merge(x = count, y = sen_list,by.x = "cosponsor", by.y = "last_name", all.x = TRUE, all.y = FALSE))
count2 <- subset(count2, select = -c(4:12, 14:48))
count2 = (merge(x = count2, y = sen_list,by.x = "sponsor", by.y = "last_name", all.x = TRUE, all.y = FALSE))
count2 <- subset(count2, select = -c(5:13, 15:489))
count2$cp <- as.character(count2$party.x)
count2$sp <- as.character(count2$party.y)
count2 <- subset(count2, select = -c(4:5))

count2 <- count2 %>%
  relocate(cosponsor)

count2$fromto <- ifelse(count2$cp == "R" & count2$sp == "R", "R", 
                        ifelse(count2$cp == "R" & count2$sp == "D", "RD",
                               ifelse(count2$cp == "R"& count2$sp == "ID", "RID",
                                      ifelse(count2$cp == "D" & count2$sp == "D", "D",
                                             ifelse(count2$cp == "D" & count2$sp == "R", "DR",
                                                    ifelse(count2$cp == "D" & count2$sp == "ID", "DID",
                                                           ifelse(count2$cp == "ID" & count2$sp == "ID", "ID",
                                                                  ifelse(count2$cp == "ID" & count2$sp == "R", "IDR", "IDD"))))))))

#vertices
vert <- data.frame()
vert <- count %>%
  group_by(sponsor) %>%
  summarize(n = n())
vert$value <- (10)
vert$div <- vert$n/vert$value
vert$party <- sen_list$party

#network
network <- graph_from_data_frame(d = count2, vertices = vert, directed = F)

#vertices color and size
V(network)$color <- NA
V(network)$color <- ifelse(V(network)$party == "R", "red",
                           ifelse(V(network)$party == "D", "blue", "green"))
V(network)$size <- NA
V(network)$size <- vert$div

#degree
degree_score <- degree(network, mode = 'total')
betw_score <- betweenness(network)
head(degree_score, 3)

#edges colors
party_colors <- c(
  'R' = '#CC0000',
  'RD' = '#800080',
  'RID' = '#A52A2A',
  'D' = '#0000ED',
  'DR' = '#EEEE00',
  'DID' = '#004080',
  'ID' = '#33D633',
  'IDR' = '#6B8E23',
  'IDD' = '#ADD8E6'
)
party_colors_semitransp <- paste0(party_colors, '40')   
names(party_colors_semitransp) <- names(party_colors)
E(network)$color <- NA
E(network)$color <- party_colors_semitransp[E(network)$fromto]

#layout
l <- layout_with_fr(network)

co <- layout.auto(network)

png(filename = here("fig/Network10.png"), width = 3960, height = 2160)

plot(network,
  frame = F,
  layout = l,
  vertex.label.cex = 0.7,
  vertex.color = adjustcolor(V(network)$color, alpha.f = 0.9),
  vertex.label.color = 'black',
  edge.arrow.size = .005,
  edge.width = .3,
  edge.curved = 0.1)
title("US Senate connection in introduced bills",
      cex = 20, line = 1)
legend('bottom', legend = names(party_colors), col = party_colors,
       pch = 15, bty = "n",  pt.cex = 1.25, cex = 1,
       text.col = "black", horiz = TRUE)

dev.off()
