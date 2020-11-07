## All the packages you need
list_of_pkgs <- c("shiny", "shinyWidgets", "shinydashboard", #"shinyDataFilter",        # App
                  "dplyr", "tidyr", "stringr", "DT",                                    # Data
                  "ggplot2", "gtable", "grid", "gridExtra", "RColorBrewer", "pheatmap", # Visualization
                  "UpSetR", "plotly",                                                  
                  "nlme", "survival"                                                    # Modeling
                  )
not_installed_pkgs <- list_of_pkgs[which(!(list_of_pkgs %in% installed.packages()[,1]))]

install.packages(not_installed_pkgs)



