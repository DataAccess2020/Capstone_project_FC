library(xml2)
setwd("/Users/fcata/OneDrive/Desktop/Capstone_project_FC/data/Bill")
a <- read_xml("BILLS-117s1is.xml")

xml_name(a)
xml_text(a)

xml_nodeset(a)


list <- as_list(a)

scs <- list[[1]][[2]][[6]][[2]]

sponsor <- list()

i <- 1
for (i in 1:99){
  step <- c(scs[[i]])
  sponsor[[length(sponsor)+1]] <- step
}


sponsor[[97]][[1]]
cosp <- list()

x <- 1
for (x in 1:97){
  step1 <- c(sponsor[[i]][[1]])
  cosp[[length(cosp)+1]] <- step1
}

sps <- data.frame(unlist(sponsor))

deletion <- seq(1,99, by = 2)
dfRemain <- data.frame(sps[c(deletion), ])
dfRemain <- data.frame(dfRemain[c(1:49), ])

