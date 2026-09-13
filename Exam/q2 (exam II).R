library(datasets)
library(ggplot2)
library(mosaic)
library(mosaicData)
library(readxl)
library(shiny)
library(shinydashboard)
library(shinythemes)
library(shinyWidgets)

View(airquality)


average_temp = aggregate(Temp ~ Month, data = airquality, FUN = mean)

# Create ggplot
ggplot(average_temp, aes(x = Month, y = Temp)) +
  geom_bar(stat = "identity", fill = "skyblue", width = 0.7) +
  labs(title = "Average Air Temperature Across the Month",
       x = "Month",
       y = "Average Temperature",
       subtitle = "Interesting Insight:\nWarmer months (e.g., July) during 2nd half.") +
  geom_text(aes(label = sprintf("%.1f", Temp)), vjust = -.25, color = "black") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 0, hjust = 1), 
        panel.grid.major = element_blank(),  # Remove major grid lines
        panel.grid.minor = element_blank())
  