library(shiny)
library(janitor)
library(DT)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  datos <- eventReactive(input$go, {
    tmp <- read.csv(input$archivo$datapath, encoding = "UTF-8")
    tmp <- janitor::clean_names(tmp)
    return(tmp)
  })
  
  output$tabla <- DT::renderDT({
    if(class(datos()) != "data.frame") NULL
    DT::datatable(datos(), rownames = F, 
                  options = list(scrollX = TRUE, fixedColumns = TRUE))
  })
  
  observe({
    updateSelectInput(session = session, inputId = "varx", choices = c("ninguna", names(datos())))
    updateSelectInput(session = session, inputId = "vary", choices = c("ninguna", names(datos())))
    updateSelectInput(session = session, inputId = "col", choices = c("ninguna", names(datos())))
  })
  
  g <- reactive({

    if(input$varx == "ninguna" & input$vary != "ninguna"){
      xval <- NULL
      yval <- input$vary
    }else if(input$varx != "ninguna" & input$vary == "ninguna"){
      xval <- input$varx
      yval <- NULL
    }else if(input$varx != "ninguna" & input$vary != "ninguna"){
      xval <- input$varx
      yval <- input$vary
    }

    if(input$col == "ninguna") col <- NULL
    if(input$col != "ninguna") col <- input$col

    tryCatch(g <- my_autoplot(data = datos(), xval = xval, yval = yval,
                              fillval = NULL, colourval = col),
             error = function(e) stop("Ups, ha ocurrido un error. Lo sentimos. Estamos trabajando para mejorar su experiencia."))

    g
  })

  output$grafico <- renderPlot({
    g()
  })
  
})