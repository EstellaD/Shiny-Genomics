ui <- dashboardPage(
  dashboardHeader(title = "My Dashboard Template", titleWidth = 275,
                  tags$li(class = "dropdown",
                          actionLink("jumpto_study", "Study Selection", icon = icon("fas fa-braille"))),
                  tags$li(class = "dropdown",
                          actionLink("showinfo", "", icon = icon("info-circle"))),
                  tags$li(class = "dropdown",
                          actionLink("showtutorial", "", icon = icon("question-circle")))
  ),
  
  dashboardSidebar(
    width = 275,
    sidebarMenu(
      id = "sidebar",
      menuItem("Project Overview", tabName = "Overview", icon = icon("dashboard")),
      menuItem("Study Selection", tabName = "StudySelection", icon = icon("fas fa-braille")),
      menuItem("Summary Statistics", tabName = "SummaryStats", icon = icon("th")),
      menuItem("Function Analysis", tabName = "FuncAnalysis", icon = icon("fas fa-project-diagram"))
    )
  ),
  
  dashboardBody(
    tabItems(
      source(file.path("tabs", "tab0_overview_ui.R"), local = TRUE)$value,
      source(file.path("tabs", "tab1_studyselection_ui.R"), local = TRUE)$value,
      source(file.path("tabs", "tab2_summarystats_ui.R"), local = TRUE)$value,
      source(file.path("tabs", "tab3_funcanalysis_ui.R"), local = TRUE)$value
    )
  )
)


server <- function(input, output, session){
  # include the server part for each tab
  
  # jump to study menu item
  
  # show info modal in header
  
  # show tutorial modal in header
  
}
  

shinyApp(ui, server)









