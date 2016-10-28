library(shiny)
library(UsingR)
library(DT)

data("diamonds")

cutTypes <- sort(unique(factor(diamonds$cut)))
colorTypes <- sort(unique(factor(diamonds$color)))
clarityTypes <- sort(unique(factor(diamonds$clarity)))
minCarat <- min(diamonds$carat)
maxCarat <- max(diamonds$carat)
minDepth <- min(diamonds$depth)
maxDepth <- max(diamonds$depth)
minTable <- min(diamonds$table)
maxTable <- max(diamonds$table)
minX <- min(diamonds$x)
maxX <- max(diamonds$x)
minY <- min(diamonds$y)
maxY <- max(diamonds$y)
minZ <- min(diamonds$z)
maxZ <- max(diamonds$z)

panelLeft <- function() {
    wellPanel(
        fluidRow(
            column(12,
                   sliderInput("iSliderCarat", "Carat", value = 2, min = minCarat, max = maxCarat, step = 0.1),
                   sliderInput("iSliderDepth", "Depth", value = 50, min = minDepth, max = maxDepth, step = 1.0),
                   sliderInput("iSliderTable", "Table", value = 60, min = minTable, max = maxTable, step = 1.0)
            )
        )
    )
}

panelRight <- function() {
    wellPanel(
        fluidRow(
            column(12,
                   sliderInput("iSliderX", "X", value = 1, min = minX, max = maxX, step = 0.1),
                   sliderInput("iSliderY", "Y", value = 10, min = minY, max = maxY, step = 0.1),
                   sliderInput("iSliderZ", "Z", value = 15, min = minZ, max = maxZ, step = 0.1)
            )
        )
    )
}

panelBottom <- function() {
    wellPanel(
        fluidRow(
            column(4, selectInput("iSelectCut", "Cut Type", choices = cutTypes, selected = "Good")),
            column(4, selectInput("iSelectColor", "Color Type", choices = colorTypes, selected = "F")),
            column(4, selectInput("iSelectClarity", "Clarity Type", choices = clarityTypes, selected = "VS1"))
            
        )
    )
}

panelOutput <- function() {
    wellPanel(
        fluidRow(
            column(5, submitButton("Calculate"), align = "right"),
            column(3, verbatimTextOutput("oPrice"), align = "left")
        )
    )
}

shinyUI(
    fluidPage(
        tags$style(type="text/css", "label {font-size: 13px;}"), 
        tags$h2("Diamond's Price Prediction"),
        hr(),
        fluidRow(column(6, panelLeft()),
                 column(6, panelRight())),
        fluidRow(column(12, panelBottom(), align="center")),
        hr(),
        fluidRow(column(12, panelOutput(), align="center"))
    )
)