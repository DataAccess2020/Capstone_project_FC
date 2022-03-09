number <- (1:3687)

cosp_data$number <- number
spon_data$number <- number

cosp_data$sponsor <- spon_data$V1

att <- cosp_data %>%
  select_if(is.character) %>%
  pivot_longer(!sponsor, names_to = "name", values_to = "cosponsor")

count <- att %>% 
  group_by(sponsor, cosponsor)  %>%
  summarize(n = n())

count <- count %>% 
  filter(!is.na(cosponsor)&!is.na(sponsor))

count$sponsor <- str_replace(count$sponsor, "M[rs][s]*\\.[\\s]*", "")
count$cosponsor <- str_replace(count$cosponsor, "M[rs][s]*\\.[\\s]*", "")

network <- graph_from_data_frame(d = count, directed = F) 
deg <- degree(network, mode = "all")
plot(network, vertex.size=6, vertex.color=rgb(0.1,0.7,0.8,0.5))
