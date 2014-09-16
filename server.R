library(shinyapps)
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
my.names = c("home.team", "away.team",	"home.wins",	"away.wins")

baseball = as.data.frame(my.data)
names(baseball) = my.names

shinyServer(  function(input, output) {
  
    
    output$barPlot <- renderChart({
            
      team.A.home = subset(baseball, baseball$home.team == input$H.team)
      AxB =  subset(team.A.home, team.A.home$away.team == input$A.team)
      names(team.A.home) = c("Home Team" , "Away Team", "Home Team Wins", "Home Team Losses")
      
      AvsB = rbind(c(input$H.team,as.numeric(AxB[3])),c(input$A.team,as.numeric(AxB[4])))
      AvsB = as.data.frame(AvsB)#, col.names =  c("Team","Wins"))
      names(AvsB) = c("Team","Wins")
            
              
      p = rPlot(x = "Team", y = "Wins",
            data = AvsB, type = 'bar')
      p$addParams(dom = 'barPlot')
            return(p)
     
    })
    
    output$text1 <- renderText({ 
      paste("You have selected", input$H.team, "Vs" , input$A.team, "games in", input$H.team)
    })
    
    output$text2 <- renderText({ 
      paste("Games that the", input$H.team, "played as home team")
    })
    
    output$view <- renderTable({
      team.A.home = subset(baseball, baseball$home.team == input$H.team)
      names(team.A.home) = c("Home Team" , "Away Team", "Home Team Wins", "Home Team Losses")
      team.A.home
    })
    
    
})
