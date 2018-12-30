#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

   output$snrPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
   N <- 15
   NT <- 10
   pi <- 3.14159

   snr <- input$snr
   varn <- 10^(-snr/20)/sqrt(2)

   x    <- sin(2*pi*c(0:((N*NT)-1))/N)
   noisy_x <- x + varn*rnorm(N*NT)

   df <- data.frame(x=c(0:((N*NT)-1)), y=noisy_x)

   # draw the signal with the specified SNR
       ggplot(data=df, aes(x=x,y=y)) + geom_line() + geom_point() + theme_bw() + labs(title="Waveform", x="Sample Number", y="Voltage") + ylim(-6,6)
   })

})
