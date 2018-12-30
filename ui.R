#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Signal-to-Noise Ratio Visualization"),

  # Sidebar with a slider input for SNR selection
  sidebarLayout(
    sidebarPanel(

       sliderInput("snr",
                   "SNR to plot:",
                   min = -6,
                   max = 40,
                   value = 10)
    ),

    # Show a plot of the generated distribution
    mainPanel(
       h3("Instructions"),
       p("This application demonstrates how a simple signal (sine wave) looks at various signal-to-noise ratio (SNR) levels."),
       p("The signal is a sine wave with aplitude of 1V. The added noise is Gaussian distributed with a variance that corresponds to the selected SNR."),
       p("Move the SNR slider to see the waveform at different values. It's fun!!!"),
       plotOutput("snrPlot")
    )
  )
))
