cat(file=stderr(), "-- Loading Tab 1 Study Selection --", "\n")

## Study Summary 1
output$synop <- renderUI({
  includeMarkdown(paste0("www/synopsis/", input$studyid, ".md"))
})

bystudy_sn <- reactive({metadata(mae)$sample_number_list$bystudy[[ input$studyid ]]})
bystudy_feature <- reactive({metadata(mae)$feature_list$bystudy[[ input$studyid ]]})

# Calculating summary stats
sumStats_study <- reactive({
  sumStats_study <- list(sumRNApts = length(bystudy_sn()$`RNA`),
                         sumRNAgenes = length(bystudy_sn()$`RNA`),
                         sumDNApts = length(bystudy_sn()$`DNA`),
                         sumDNAgenes = length(bystudy_sn()$`DNA`),
                         sumCellpts = length(bystudy_sn()$`Cell`),
                         sumCellgenes = length(bystudy_sn()$`Cell`)
                         )
  lapply(sumStats_study, function(x) ifelse(is.null(x), 0, x))
})

observeEvent(input$studyid, {
  callModule(m_SummaryBoxSrv, "sumRNApts_study", sumStats_study()$sumRNApts, "RNA-Seq Samples", tags$i(class = "fas fa-crutch"), "blue")
  callModule(m_SummaryBoxSrv, "sumRNAgenes_study", sumStats_study()$sumRNAgenes, "RNA-Seq Genes", tags$i(class = "fas fa-crutch"), "blue")
  callModule(m_SummaryBoxSrv, "sumDNApts_study", sumStats_study()$sumDNApts, "DNA Samples", tags$i(class = "fas fa-dna"), "orange")
  callModule(m_SummaryBoxSrv, "sumDNAgenes_study", sumStats_study()$sumDNAgenes, "DNA Genes", tags$i(class = "fas fa-dna"), "orange")
  callModule(m_SummaryBoxSrv, "sumCellpts_study", sumStats_study()$sumCellpts, "Cell Samples", tags$i(class = "fas fa-disease"), "green")
  callModule(m_SummaryBoxSrv, "sumCellgenes_study", sumStats_study()$sumCellgenes, "Cell Genes", tags$i(class = "fas fa-disease"), "green")
})

output$upsetplot_study <- renderPlot({
  validate(
    need(length(bystudy_sn()) != 1, "This study currently has RNASeq only or FMI only data, so upset plot visualization will not be provided.")
  )
  draw_upsetplot(bystudy_sn())
})

output$maedat <- renderPrint({
  mae_study <- dropEmptyColAssays(mae[, mae$STUDYID == input$studyid, drop = FALSE])
  display <- lapply(mae_study@ExperimentList@listData, class) != "matrix"
  mae_study@ExperimentList@listData[display]
})


## Study Doc2
output$studydocs <- renderUI({
  fluidRow(
    column(6,
           h2("Study Publication"),
           br(),
           tags$iframe(src = paste0("publication/", input$studyid, ".pdf"),
                       width = '100%', height = '1000px', frameborder = 0, scrolling = 'auto')),
    column(6,
           h2("Related Publication"),
           br(),
           tags$iframe(src = paste0("relatedpub/", input$studyid, ".pdf"),
                       width = '100%', height = '1000px', frameborder = 0, scrolling = 'auto'))
  )
})


# ## Identify Genes 3
# # Volcano plot
# output$plotvoc <- renderPlot({
#   plot(mtcars$wt, mtcars$mpg, main = "Scatterplot Example",
#        xlab = "Car Weight", ylab = "Miles Per Gallon", pch=19)
# })
# 
# # Brush Table
# output$tablebrush <- renderTable(brush)



