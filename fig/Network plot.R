colnames(cosp_data) = rownames(cosp_data[1:3687, 1:57]) = (1:100)

number <- as.vector(1:3687)

cosp_data$number <- number
spon_data$number <- number

spocospo = merge(spon_data, cosp_data, by = "number")

data_count_2 <- spocospo %>%                              # Applying group_by & summarise
  group_by(V1.x) %>%
  summarise(count = n_distinct(x))
data_count_2 