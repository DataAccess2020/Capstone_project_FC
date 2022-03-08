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

write.csv(spon_data, "spon_data.csv")
write.csv(cosp_data, "cosp_data.csv")

spon_data <- import("spon_data.csv")
cosp_data <- import("cosp_data.csv")

spon_data <- subset(spon_data, select = -c(V1))
cosp_data <- subset(cosp_data, select = -c(V1))


