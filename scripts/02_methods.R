library(readr)
library(dplyr)
library(ggplot2)

data <- read_csv("data/penguins-cleaned.csv") 

#glimpse (can't save to csv)
glimpse <- glimpse(data)

#summary statistics
summary_stats <- summarise(data, mean_bill_length = mean(bill_length_mm), mean_bill_depth = mean(bill_depth_mm))

# Save to CSV
write_csv(summary_stats, "output/summary_statistics.csv")

# Visualizations
boxplot <- ggplot(data, aes(x = species, y = bill_length_mm, fill = species)) +
  geom_boxplot() +
  theme_minimal()

#Save boxplot
ggsave("output/boxplot.png")

