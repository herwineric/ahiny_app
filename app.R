

library(shiny)
library(httr)
library(png)
library(jsonlite)

# UI
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput("search", "Search: "),
         sliderInput("zoom",
                     "Zoom lv:",
                     min = 3,
                     max = 21,
                     value = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot", height = "640px")
      )
   
)
)

# SERVER
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
      
     if(input$search == ""){
       plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
       
     } else {
       plota_karta(input$search, zoom = input$zoom)
       Sys.sleep(0.3)
     }
      
     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

