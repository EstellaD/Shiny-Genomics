cat(file = stderr(), "-- Loading Tab 2 Gene Graphs --", "\n")

# Link to gene literature bank: https://www.ncbi.nlm.nih.gov/search/all/?term=CD274

# HTML headers Arm ABC
output$ncbi <- renderUI({
  tags$a(href = paste0("https://www.ncbi.nlm.nih.gov/search/all/?term=", input$textGeneName),
         "NCBI Publication Link")
})

## Gene Graphs
# Counts
output$plotcountabc1 <- renderPlot({
  # TODO make 3 side by side
})

# OS
output$plotostabc1 <- renderPlot({
  # TODO make 3 side by side
})

# PFS
output$plotpfsabc1 <- renderPlot({
  # TODO make 3 side by side
})


# TODO: This approach is makint side by side as a list
output$Box_Arm_ui <- renderUI({
  fluidRow(
    column(12, plotlyOutput("Box_Arm_plot"))
  )
})

output$Box_Arm_plot <- renderPlotly({
  pltlist <- list(freqplotfn(Data, "AgeatDiag_cat", "Age"),
                  freqplotfn(Data, "Gender", "Gender"),
                  freqplotfn(Data, "Race", "Race"))
  
  subplot(pltlist,
          nrows = 3,
          titleX = F,
          titleY = T,
          shareX = F,
          shareY = F,
          margin = 0.06) %>%
    layout(showlegend = F)
})






