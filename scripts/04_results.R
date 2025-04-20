library(readr)
library(dplyr)
library(workflows)
library(yardstick)
library(ggplot2)

penguin_fit <-read_rds("models/penguins_model_knn.rds")

test_data <- read_csv("data/penguins-test-data.csv")

test_data <- test_data %>%
  mutate(species = as.factor(species))

# Predict on test data
predictions <- predict(penguin_fit, test_data, type = "class") %>%
  bind_cols(test_data)

# Confusion matrix
conf_mat <- conf_mat(predictions, truth = species, estimate = .pred_class)

#Save confusion matrix
conf_mat_plot <- autoplot(conf_mat, type = "heatmap") +
  labs(title = "Confusion Matrix") +
  theme_minimal()

ggsave("output/confusion_matrix.png")