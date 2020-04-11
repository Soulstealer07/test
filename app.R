#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
load(url("https://raw.githubusercontent.com/Soulstealer07/test/master/Gasoline.RData"))
#Define User Interface for Application
ui <- fluidPage(
    #Application Title
    titlePanel("Gasoline Price Trend Analysis"),
    sidebarLayout(
        #Inputs(Select which inputs from the data we want to display)
        sidebarPanel(
            #Select variables for Y axis
            selectInput(inputId = "y",
                        label = "y-axis:",
                        choices=c("Value","X1.Month.Net.Change","X3.Month.Net.Change"),
                        selected="Value"),
            #Select x-axis variables
            selectInput(inputId = "x",
                        label="x-axis:",
                        choices=c("Year"),
                        selected="Year")
            ),
        
        #Output:Type of Plot
        mainPanel(
            plotOutput(outputId = "FreqTab")
        )
    )
)


    



# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$FreqTab <- renderPlot({
        # draw the histogram with the specified number of bins
        ggplot(t, aes_string(x=input$x, y=input$y)) + geom_point() #Notice the difference between the ggplots
    })
}

# Run the application 
shinyApp(ui = ui, server = server)