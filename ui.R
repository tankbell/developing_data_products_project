library(markdown)

shinyUI(navbarPage("US Census Data",
  tabPanel("Visualization",
  sidebarLayout(
    sidebarPanel(
      selectInput("state", "State",
                  choices = states),
      selectInput("demographics", "Demographics",
                  choices = demographic)
    ),
    
    # Show Stats as a Map Graph.
    mainPanel(
       plotOutput("plot")
    )
  )
 ) , # End - Visualization tab.
 tabPanel("About",
          mainPanel(includeMarkdown("about.md"))
 )
))