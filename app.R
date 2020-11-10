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
  source(file.path("tabs", "tab0_overview_srv.R"), local = TRUE)$value
  source(file.path("tabs", "tab1_studyselection_srv.R"), local = TRUE)$value
  source(file.path("tabs", "tab2_summarystats_srv.R"), local = TRUE)$value
  source(file.path("tabs", "tab3_funcanalysis_srv.R"), local = TRUE)$value
  
  # jump to study menu item
  observeEvent(input$jumpto_study, {
    updateTabItems(session, "sidebar", "StudySelection")
  })
  
  # show info modal in header
  observeEvent(input$showinfo, {
    showModal(modalDialog(
      title = "Contacts",
      h4("This shiny dashboard is brought to you by the Queen of the Otterland.  ",
         tags$a(href="https://en.wikipedia.org/wiki/Asian_small-clawed_otter", "Source Code")),
      br(),
      h4("Dashboard Development Team"),
      tags$ul(
        tags$li("App Developer: ", tags$a(href="mailto: helloworld@yay.com", "Otter Queen (Canada)")),
        tags$li("Data Analyst: ", tags$a(href="mailto: happyworld@yay.com", "Otter Majesty (China)")),
        tags$li("Representative: ", tags$a(href="mailto: alloworld@yay.com", "Otter Highness (Switzerland)"))
      ),
      easyClose = TRUE
    ))
  })
  
  # show tutorial modal in header
  observeEvent(input$showtutorial, {
    showModal(modalDialog(
      title = "Tutorial",
      p("Instruction is under development"),
      easyClose = TRUE
    ))
  })
}
  

shinyApp(ui, server)









