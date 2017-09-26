

library(shiny)
library(Lab5InYourFace)

# UI
ui <- fluidPage(
   
   # Application title
   titlePanel("Search with google"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput("search", "Search: "),
         sliderInput("zoom",
                     "Zoom lv:",
                     min = 3,
                     max = 21,
                     value = 10)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot", height = "640px"),
         tableOutput('table')
      )
   
)
)

# SERVER
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
      
     if(input$search == ""){
       plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
       
     } else {
       plot_address(input$search, zoom = input$zoom)
       Sys.sleep(0.3)
     }
    
     if(input$search == ""){
       
     } else {
       output$table <- renderTable(data_address(input$search))
       
     }
     
     
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

