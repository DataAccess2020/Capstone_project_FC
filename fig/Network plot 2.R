network <- simpleNetwork(count, height="100px", width="100px",        
                   Source = 1,                 
                   Target = 2,                 
                   linkDistance = 100,          
                   charge = -900,                
                   fontSize = 10,               
                   fontFamily = "serif",       
                   linkColour = "#666",        
                   nodeColour = "#69b3a2",     
                   opacity = 0.9,              
                   zoom = T                   
)

saveWidget(network, file = "network.html")
