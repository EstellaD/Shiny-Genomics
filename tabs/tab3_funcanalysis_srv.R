cat(file = stderr(), "-- Loading Tab 3 Function Analysis --", "\n")

## Gene Network
output$plotprocess <- renderPlot(({
  # TODO: process
}))

# Update process gene selection box
observe({
  updateSelectizeInput(session,
                       'process_choices', 
                       choices = unique(unlist(strsplit(unique(process_list), ","))),
                       selected = "Process101",
                       server = TRUE,
                       options = list(maxItems = 10))
})

