bill1 <- as.list(as.character(stri_paste("1 (",1:3678,").xml")))

bill_list <- list()

i <- 1
for(i in 1:3678){
  step <- data.frame(read_xml(bill1[[i]]))
}

bill_list[[1]]

xml_node(bill_list[[1]])

al <-read_xml(bill1[[2]])
