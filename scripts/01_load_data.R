library(palmerpenguins)
library(dplyr)
library(tidyr)
library(readr)

#Load data
data <- penguins

#Save raw dataset
write_csv(data, "data/penguins-raw.csv")

# Initial cleaning: Remove missing values
data <- data %>% drop_na()

#Save cleaned dataset
write_csv(data, "data/penguins-cleaned.csv")
