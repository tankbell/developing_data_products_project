library(shiny)

source("global.R")

# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {

  df_county_demographics_value <- reactive({
           switch(input$demographics,
                  "percent_white" = df_county_demographics$percent_white,
                  "percent_black" = df_county_demographics$percent_black,
                  "percent_hispanic" = df_county_demographics$percent_hispanic,
                  "percent_asian" = df_county_demographics$percent_asian,
                  "per_capita_income" = df_county_demographics$per_capita_income,
                  "median_rent" = df_county_demographics$median_rent,
                  "median_age" = df_county_demographics$median_age)
  })
  
  output$plot <- renderPlot({
    df_county_demographics$value = df_county_demographics_value()
    county_choropleth(df_county_demographics,
                      state_zoom = input$state,
                      num_colors = 9) + coord_map()
  })
})