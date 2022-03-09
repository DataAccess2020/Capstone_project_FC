spon_list <- list()

i <- 1
for (i in 1:3687){
  path <- str_c("1 (", i, ").xml")
  a <- read_xml(path)
  cosp <- c(xml_find_all(a, ".//form/action/action-desc/sponsor") %>%
    xml_text())
  spon_list[[length(spon_list)+1]] <- cosp
}

cosp_list <- list()

z <- 1
for (z in 1:3687){
  path <- str_c("1 (", z, ").xml")
  a <- read_xml(path)
  cosp <- c(xml_find_all(a, ".//form/action/action-desc/cosponsor") %>%
              xml_text())
  cosp_list[[length(cosp_list)+1]] <- cosp
}

spon_data <- as.data.frame(t(stri_list2matrix(spon_list)))

cosp_data <- as.data.frame(t(stri_list2matrix(cosp_list)))

setwd("C:/Users/fcata/OneDrive/Desktop/Capstone_project_FC/data/")

number <- (1:3687)

cosp_data$number <- number
spon_data$number <- number

spon_data <- subset(spon_data, select = -c(V1))
cosp_data <- subset(cosp_data, select = -c(V1))

write.csv(spon_data, "spon_data.csv")
write.csv(cosp_data, "cosp_data.csv")

spon_data <- import("spon_data.csv")
cosp_data <- import("cosp_data.csv")

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
count$sponsor <- str_replace(count$sponsor, "Wyden[\\s]*", "Wyden")
count$cosponsor <- str_replace(count$cosponsor, "Wyden[\\s]*", "Wyden")
count$sponsor <- str_replace(count$sponsor, "Ernst[\\s]*", "Ernst")
count$cosponsor <- str_replace(count$cosponsor, "Ernst[\\s]*", "Ernst")
count[count == "Van [s]Hollen"] <- "Van Hollen"

count <- count %>%
  relocate(cosponsor)

write.csv(count, "count.csv")

count <- import("count.csv")
count <- subset(count, select = -c(V1))
