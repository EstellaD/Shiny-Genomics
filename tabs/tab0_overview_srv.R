cat(file = stderr(), "-- Loading Tab 0 Introduction to My Data --", "\n")

# Header
output$title_text <- renderUI({
  HTML(
    "<div style='text-align: centre;'>
        <span style='font-size: 3em;'>
          <p><strong> Overview: My Datamart </strong></p>
        </span>
    </div>"
  )
})

# Intro Data
output$intromydashboard <- renderUI({
  HTML(
    "<div style='text-align: centre;'>
       <span style='font-size: 1.2em;'>
          <p><strong> The datamart project goal is to provide harmonized and integrated RNA data for a set of selected studies, along with the infrastructure and processes that will allow future enhancements and use the data by the RNA community. </strong></p>
          <p><strong> Clinical data integrated with RNA biomarkers and linkage to Whole Genome Sequence (WGS) has been provided. </strong></p>
       </span>
    </div>"
  )
})

# Web ext
output$webs <- renderUI({
  includeMarkdown(paste0("www/synopsis/Overview.md"))
})

output$timeline <- renderUI({
  HTML(
    "<div style='text-align: centre;'>
        <span style='font-size: 1.5em;'>
          <p><strong> Timeline of this Datamart </strong></p>
        </span>
    </div>"
  )
})

# Table
tableCIT <- readRDS(normalizePath("www/pngs/tableCIT.rds"))
output$table1 <- renderTable(tableCIT,
                             striped = TRUE, bordered = TRUE,
                             hover = TRUE, spacing = 'xs')




