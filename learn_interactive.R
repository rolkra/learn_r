#############################################################################
## Shiny - save file as app.R
#############################################################################

library(shiny)

#-----------------------------------------------------------------------------
# shinyUI
#-----------------------------------------------------------------------------

ui <- fluidPage(
  sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
  textInput(inputId = "title", 
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
  plotOutput("hist")
)

#-----------------------------------------------------------------------------
# shinyServer
#-----------------------------------------------------------------------------

server <- function(input, output) {
  output$hist <- renderPlot({
    hist(rnorm(input$num), main = input$title, col="grey")
  })
}

#-----------------------------------------------------------------------------
# run APP
#-----------------------------------------------------------------------------

shinyApp(ui = ui, server = server)

#############################################################################
## Interactive 3D Plot
#############################################################################

library(rgl)
example(surface3d)
example(plot3d)

# iris data
data(iris)
plot3d(iris$Sepal.Length, iris$Sepal.Width, iris$Petal.Length, 
       col = ifelse(iris$Species == "setosa", "red", 
             ifelse(iris$Species == "virginica", "blue", "green")),
       size = 5)

# rainbow
open3d()
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
plot3d(x, y, z, col = rainbow(1000))


#############################################################################
## Network igraph
#############################################################################

install.packages("igraph")
library('igraph')
df <- data.frame(from=c("A","A","A","B"), to=c("B","C","D","D"), weight=c(1,2,3,1))
df
net <- graph_from_data_frame(df, directed=T) 
net
plot(net, edge.width=df$weight)
