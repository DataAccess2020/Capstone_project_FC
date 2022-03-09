bill1 <- as.list(as.character(stri_paste("1 (",1:3678,").xml")))

bill_list <- list()

i <- 1
for(i in 1:3678){
  step <- read_xml(bill1[[i]])
  bill_list[[length(bill_list)+1]] <- step
}

bill_list[[1]]

xml_node(bill_list[[1]])

al <- C(read_xml(bill1[[2]]))
