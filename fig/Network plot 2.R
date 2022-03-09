network <- simpleNetwork(count, height="100px", width="100px",        
                   Source = 1,                 
                   Target = 2,                 
                   linkDistance = 10000,          
                   charge = -90,                
                   fontSize = 100,               
                   fontFamily = "serif",       
                   linkColour = "#666",        
                   nodeColour = "red",     
                   opacity = 1,              
                   zoom = T                   
)

saveWidget(network, file = "network.html")
