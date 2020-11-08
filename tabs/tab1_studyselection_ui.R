tabItem(tabName = "StudySelection",
        
        fluidRow(
          # total patient count in current studies
          valueBox("1202", h4("Patients"),
                   icon = icon("user"), color = "aqua"),
          
          # num locations
          valueBox("287", h4("Study Locations"),
                   icon = tags$i(class = "fas fa-map-marker-alt"), color = "light-blue"),
          
          # current study expected completion date
          valueBox("2019-12-22", h4("Expected Study Completion Date"),
                   icon = icon("thumbs-up"), color = "purple")
          
        ),
        
        fluidRow(
          box(width = 3,
              title = "Study Selection",
              solidHeader = TRUE, status = "primary",
              selectInput("studyid", label = NULL, choices = studyList, selected = studyList["TAT007 - Fantastic RNA 1"]),
              htmlOutput("synop")
          ),
          
          tabBox(width = 9, 
                 tabPanel(title = strong("Individual Study"),
                          h3("Datatype Summary"),
                          fluidRow(
                            column(width = 5, br(),
                                   m_SummaryBoxUI("sumRNApts_study", 6), m_SummaryBoxUI("sumRNAgenes_study", 6),
                                   m_SummaryBoxUI("sumDNApts_study", 6), m_SummaryBoxUI("sumDNAgenes_study", 6),
                                   m_SummaryBoxUI("sumCellpts_study", 6), m_SummaryBoxUI("sumCellgenes_study", 6)
                            ),
                            column(width = 7, plotOutput("upsetplot_study"))
                          ),
                          hr(),
                          h3("Summary of Available Biomarker Data"),
                          verbatimTexOutput(),
                          hr(),
                          htmlOutput("publications")
                 ), # tabPanel1
                 
                 tabPanel(
                   title = strong("Study Documents"),
                   htmlOutput("studydocs")
                 ), # tabPanel2
                 
                 tabPanel(
                   title = strong("Identify Genes"),
                   
                   fluidRow(
                     # Volcano Plot
                     box(title = "Volcano Plot", status = "info", solidHeader = TRUE, collapsible = FALSE,
                         width = 12,
                         
                         # Select Arm
                         selectInput("vararm",
                                     width = 400,
                                     label = "Choose a treatment arm to display",
                                     choices = list("Drug Standard",
                                                    "Drug Novel",
                                                    "Drug Immunotherapy"),
                                     selected = "Drug Novel"
                         ),
                         
                         plotOutput("plotvoc", height = 250)
                     ),
                     
                     # Table Brush
                     box(title = "Gene Table", status = "warning", solidHeader = TRUE, collapsible = FALSE,
                         width = 12,
                         tableOutput('tablebrush')
                     )
                     
                   )
                 ) #tabPanel3
          ) # tabBox
       ) # Fluid Row
) # tabItem

