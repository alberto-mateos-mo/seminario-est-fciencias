library(dplyr)
library(magrittr)
library(fastDummies)


datos <- read.csv(url("https://raw.githubusercontent.com/alberto-mateos-mo/seminario-est-fciencias/master/03_linear_models/logistic/data/Default.csv"))

datos %<>% 
  select(-purpose, -personal_status, -property_magnitude, -other_payment_plans, -housing, -job, -num_dependents, -own_telephone, -foreign_worker)

datos <- dummy_cols(datos)

x_vars <- t(scale(datos[,c(1,3:7,9:13)]))

y_var <- t(as.matrix(datos[,8]))

model <- train_nn(x_vars, y_var, hidden_neurons = 10, iters = 10000, learning_rate = 0.9)

probas <- predict_nn(x_vars, model)

clase <- round(probas)

caret::confusionMatrix(as.factor(y_var), as.factor(clase))
 
summary(t(probas))
