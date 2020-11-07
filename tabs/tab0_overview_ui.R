tabItem(
  tabName = "Overview",
  
  htmlOutput("title_text"),
  br(),
  
  fluidRow(
    box(width = 3, 
        title = "About My Dashboard",
        solidHeader = TRUE, status = "primary",
        
        htmlOutput("intromydashboard"),
        
        br(),
        
        # Num study locations
        valueBox("17", h4("Studies"), width = 12,
                 icon = tags$li(class = "fas fa-file-prescription"), color = "blue"),
        
        br(),
        
        # Num Patients
        valueBox("12840", h4("Patients"), width = 12,
                 icon = icon("users"), color = "yellow"),
        
        br(),
        
        htmlOutput("webs"),
        
        br(),
        
        tags$img(src = "png/logo.png", height = 80, width = 120)
  ),
  
  # Table
  box(width = 9,
      title = "Overview of Study Data",
      status = "primary", solidHeader = TRUE,
      tableOutput("table1"),
      
      hr(),
      
      htmlOutput("timeline"),
      
      tags$img(src="pngs/DataCollectionTimeline.png", height = 400, width = 900)
    )
  )
)