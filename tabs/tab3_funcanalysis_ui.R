process_list <- c("Process101", "Process102", "Process103")
process_choice <- "Process101"

# Third tab content
tabItem(tabName = "FuncAnalysis",
        fluidRow(
          h2("Function Analysis"),
          
          # Select nodes for progress
          box(
            title = "Select Biological Process for Each Arm", status = "info", solidHeader = TRUE, collapsible = TRUE,
            width = 12,
            box(width = 6,
                selectizeInput(inputId = "process_choisesa",
                               label = strong("Arm: A  (recommend 10):"),
                               choices = process_list,
                               selected = process_choice,
                               multiple = TRUE,
                               width = 400)),
            box(width = 6,
                selectizeInput(inputId = "process_choisesb",
                               label = strong("Arm: B  (recommend 10):"),
                               choices = process_list, # TODO: can be diff for each arm
                               selected = process_choice, # TODO: can be diff
                               multiple = TRUE,
                               width = 400))
            # TODO: make two arms side by side
          ),
          
          # Arm A
          box(title = "Arm A", status = "primary", solidHeader = TRUE, collapsible = TRUE,
              width = 12,
              plotOutput("plotfunca", height = 250)
          ),
          
          # Arm B
          box(title = "Arm B", status = "primary", solidHeader = TRUE, collapsible = TRUE,
              width = 12,
              plotOutput("plotfuncb", height = 250)
          )
        )
)
