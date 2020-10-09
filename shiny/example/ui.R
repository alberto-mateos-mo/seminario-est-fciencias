library(shiny)
library(janitor)
library(DT)
library(ggplot2)

source("descriptives_funcs.R")

shinyUI(
  navbarPage(title = "Descriptivos App",
             tabPanel("Carga de datos.",
                      sidebarLayout(
                        sidebarPanel(
                          fileInput(inputId = "archivo", label = "Selecciona el archivo para cargar:"),
                          actionButton("go", "Cargar datos a la app.")
                        ),
                        mainPanel(
                          DT::DTOutput(outputId = "tabla")
                        )
                      )
             ),
             
             tabPanel("Graficador.",
                      sidebarPanel(
                        selectInput(inputId = "varx", "Variable 1", choices = NULL),
                        selectInput(inputId = "vary", "Variable 2", choices = NULL),
                        selectInput(inputId = "col", "Variable de color", choices = NULL)
                      ),
                      mainPanel(
                        plotOutput(outputId = "grafico")
                      )
             )
  )
)