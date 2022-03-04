library(xml2)
setwd("/Users/fcata/OneDrive/Desktop/Capstone_project_FC/data/Bill")
a <- read_xml("BILLS-117s1is.xml")

a <- as_xml_document("BILLS-117s1is.xml")

#sponsor
xml_child(xml_child(xml_child(xml_child(a, 2), 6), 2), 1)
#cosponsor
alfa <- (xml_child(xml_child(xml_child(xml_child(a, 2), 6), 2), 2))

# form - action - action_desc