library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #see following link for Algorithm
  # http://mathfaculty.fullerton.edu/mathews/n2003/montecarlopimod.html
  
  output$plotPoints <- renderPlot({
    num_points <- input$points
    x_points <- runif(num_points, -1,1)
    y_points <- runif(num_points, -1,1)  
 
    dist=sqrt(x_points*x_points+y_points*y_points)
    is_inside <- dist<1
    count_inside <- sum(is_inside)
    pi_guess <- 4*count_inside /num_points
    title <- sprintf("Monte Carlo Simulation to calculate PI\n Estimate is %4.3f - Error %3.2f percent", pi_guess, 100*(pi-pi_guess)/pi)
    plot(x_points,y_points, col=is_inside+1, main=title)

    theta = seq(0, 2*pi, 0.01)
    x <- cos(theta)
    y <- sin(theta)
    lines(x,y)
    
    })
})

