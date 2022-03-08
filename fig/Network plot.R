number <- as.vector(1:3687)

cosp_data$number <- number
spon_data$number <- number

df = merge(x = spon_data, y = cosp_data, by = "number", all = TRUE)
df= spon_data %>% left_join(cosp_data,by="number")
spocospo = merge(spon_data, cosp_data, by = "number")


