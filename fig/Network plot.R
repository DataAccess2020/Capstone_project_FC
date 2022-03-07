number <- as.vector(1:3687)

cosp_data$number <- number
spon_data$number <- number

df = merge(x = spon_data, y = cosp_data, by = "number", all = TRUE)
df= spon_data %>% left_join(cosp_data,by="number")
spocospo = merge(spon_data, cosp_data, by.x = "number", by.y = "number")


data <- data.frame()

i <- 1
for (i in 1:10){
  data <- as.data.frame(cosp_list[[1]])
} 


cosponsor <- list()
i <- 1
for (i in 1:length(cosp_list)){
  off_step <- as.data.frame(do.call(rbind, cosp_list[[i]]))
  cosponsor[[length(cosponsor)+1]] <- off_step
}

test <- data.frame(law = 1:3687)


test$co <- test %>% 
  mutate(cosp_list = sapply(cosp_list, toString))

 try<- test[1,2]

 

 
 
 
 