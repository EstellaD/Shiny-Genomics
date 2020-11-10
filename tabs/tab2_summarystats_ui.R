# Second tab content
tabItem(tabName = "GeneGraphs",
        
        # Enter Gene Name
        fluidRow(
          box(width = 4,
              radioButtons("radiogeneID", label = "Step 1: Choose Gene ID Type",
                           choices = list("Official Symbol" = 1, "Ensembl ID" = 2),
                           selected = 1)
          ),
          box(width = 4,
              textInput("textGeneName", label = "Step 2: Enter the Gene ID Number", value = "CD274"),
              helpText("Please Enter Official Symbol or Ensembl ID of the Gene"),  # TODO NCBI Interactive
          ),
          box(width = 4,
              sliderInput("obs", label = "Step 3: Threshold for Risk Groups", min = 0, max = 1000, value = 500),
              helpText("Default Threshold for High and Low Risk Groups is Median")
          )
        ),
        
        hr(),
        
        fluidRow(
          tabBox(width = 12,
                 tabPanel(title = strong("By Arm"), # so far only 1 tab of by arm
                          
                          # # TODO # Header for three treatment groups
                          # fluidRow(
                          #    h3("A"),
                          #    h3("B"),
                          #    h3("C"),
                          # ),
                          
                          fluidRow(
                            box(title = "Boxplot of Counts By Arm", status = "info", solidHeader = TRUE, collapsible = TRUE,
                                width = 12,
                                plotOutput("plotcountabc1", height = 250, width = 4)  # TODO: side by side and selection interaction
                            ),
                            
                            box(title = "Overall Survival By Arm", status = "warning", solidHeader = TRUE, collapsible = TRUE,
                                width = 12,
                                plotOutput("plotosabc2", height = 250, width = 4)
                            ),
                            
                            box(title = "Progression Free Survival By Arm", status = "danger", solidHeader = TRUE, collapsible = TRUE,
                                width = 12,
                                plotOutput("plotpfsabc3", height = 250, width = 4)
                            )
                          )
                  )
           )
        )
)