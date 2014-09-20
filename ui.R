library(shilibrary(shinyapps)
library(rCharts)
library(shiny)
require(devtools)


my.data = rbind(c("Milwaukee","Detroit",4,3),
        c("Milwaukee","Toronto",4,2),
        c("Milwaukee","New York",4,3),
        c("Milwaukee","Boston",6,1),
        c("Milwaukee","Cleveland",4,2),
        c("Milwaukee","Baltimore",6,0),
        c("Detroit","Milwaukee",3,3),
        c("Detroit","Toronto",4,2),
        c("Detroit","New York",4,3),
        c("Detroit","Boston",6,0),
        c("Detroit","Cleveland",6,1),
        c("Detroit","Baltimore",4,3),
        c("Toronto","Milwaukee",2,5),
        c("Toronto","Detroit",4,3),
        c("Toronto","New York",2,4),
        c("Toronto","Boston",4,3),
        c("Toronto","Cleveland",4,2),
        c("Toronto","Baltimore",6,0),
        c("New York","Milwaukee",3,3),
        c("New York","Detroit",5,1),
        c("New York","Toronto",2,5),
        c("New York","Boston",4,3),
        c("New York","Cleveland",4,2),
        c("New York","Baltimore",6,1),
        c("Boston","Milwaukee",5,1),
        c("Boston","Detroit",2,5),
        c("Boston","Toronto",3,3),
        c("Boston","New York",4,2),
        c("Boston","Cleveland",5,2),
        c("Boston","Baltimore",6,0),
        c("Cleveland","Milwaukee",2,5),
        c("Cleveland","Detroit",3,3),
        c("Cleveland","Toronto",3,4),
        c("Cleveland","New York",4,3),
        c("Cleveland","Boston",4,2),
        c("Cleveland","Baltimore",2,4),
        c("Baltimore","Milwaukee",2,5),
        c("Baltimore","Detroit",1,5),
        c("Baltimore","Toronto",1,6),
        c("Baltimore","New York",2,4),
        c("Baltimore","Boston",1,6),
        c("Baltimore","Cleveland",3,4))
my.names = c("home.team", "away.team",  "home.wins",	"away.wins")

baseball = as.data.frame(my.data)
names(baseball) = my.names

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("1987 Baseball Season - Results"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("H.team", "Home Team:", 
                    choices=levels(baseball$home.team)),
        
        selectInput("A.team", "Away Team:", 
                                choices=levels(baseball$home.team),
                                selected = levels(baseball$home.team[2])),
        textOutput("text3")
      
       ),  
       
      
      # Create a spot for the barplot
      mainPanel( 
           textOutput("text1"),
           showOutput("barPlot", "polycharts"),
           textOutput("text2"),
           tableOutput("view")
                      
      )
    )
  )
)
