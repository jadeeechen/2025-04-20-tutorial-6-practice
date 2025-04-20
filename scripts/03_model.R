library(readr)
library(dplyr)
library(rsample)
library(parsnip)
library(workflows)

data <- read_csv("data/penguins-cleaned.csv")

# Prepare data for modeling
data <- data %>%
  select(species, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g) %>%
  mutate(species = as.factor(species))

# Split data
set.seed(123)
data_split <- initial_split(data, strata = species)
train_data <- training(data_split)
test_data <- testing(data_split)

#Save test data
write_csv(test_data, "data/penguins-test-data.csv")

# Define model
penguin_model <- nearest_neighbor(mode = "classification", neighbors = 5) %>%
  set_engine("kknn")

# Create workflow
penguin_workflow <- workflow() %>%
  add_model(penguin_model) %>%
  add_formula(species ~ .)

# Fit model
penguin_fit <- penguin_workflow %>%
  fit(data = train_data)

#Save model
write_rds(penguin_fit, "models/penguins_model_knn.rds")