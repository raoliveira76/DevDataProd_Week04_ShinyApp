library(shiny)
library(UsingR)
library(DT)

data(diamonds)

fit <- lm(price ~ carat + depth + table + x + y + z + factor(cut) + factor(color) + factor(clarity) -1,
          data = diamonds)

shinyServer(
    function(input, output)
    {
        output$oPrice <- renderPrint(
            {
                nData <- data.frame(carat = input$iSliderCarat, 
                                    depth = input$iSliderDepth, 
                                    table = input$iSliderTable, 
                                    x = input$iSliderX, 
                                    y = input$iSliderY, 
                                    z = input$iSliderZ, 
                                    cut = input$iSelectCut, 
                                    color = input$iSelectColor, 
                                    clarity = input$iSelectClarity)
                
                noquote(paste0("US$ ", formatC(as.numeric(predict(fit, newdata = nData)), 
                                               format="f", digits=2, big.mark=",")))
            }
        )
    }
)