get_layer_size <- function(x, y, hidden_neurons) {
  
  n_x <- dim(x)[1]
  n_h <- hidden_neurons
  n_y <- dim(y)[1]   
  
  size <- list("n_x" = n_x,
               "n_h" = n_h,
               "n_y" = n_y)
  
  return(size)
  
}


random_params <- function(x, layer_size){
  
  m <- dim(data.matrix(x))[2]
  
  n_x <- layer_size$n_x
  n_h <- layer_size$n_h
  n_y <- layer_size$n_y
  
  w1 <- matrix(runif(n_h * n_x), nrow = n_h, ncol = n_x, byrow = TRUE) * 0.01
  b1 <- matrix(rep(0, n_h), nrow = n_h)
  w2 <- matrix(runif(n_y * n_h), nrow = n_y, ncol = n_h, byrow = TRUE) * 0.01
  b2 <- matrix(rep(0, n_y), nrow = n_y)
  
  params <- list("w1" = w1,
                 "b1" = b1, 
                 "w2" = w2,
                 "b2" = b2)
  
  return(params)
  
}

sigmoid_activation <- function(x){
  
  return(1/(1+exp(-x)))

}

forward_prop <- function(x, params, layer_size){
  
  m <- dim(x)[2]
  n_h <- layer_size$n_h
  n_y <- layer_size$n_y
  
  w1 <- params$w1
  b1 <- params$b1
  w2 <- params$w2
  b2 <- params$b2
  
  b1_new <- matrix(rep(b1, m), nrow = n_h)
  b2_new <- matrix(rep(b2, m), nrow = n_y)
  
  z1 <- w1 %*% x + b1_new
  a1 <- sigmoid_activation(z1)
  z2 <- w2 %*% a1 + b2_new
  a2 <- sigmoid_activation(z2)
  
  cache <- list("z1" = z1,
                "a1" = a1, 
                "z2" = z2,
                "a2" = a2)
  
  return(cache)

}

get_cost <- function(x, y, cache) {
  
  m <- dim(x)[2]
  
  a2 <- cache$a2
  
  logprobs <- (log(a2) * y) + (log(1-a2) * (1-y))
  
  cost <- -sum(logprobs/m)
  
  return(cost)
  
}

backward_prop <- function(x, y, cache, params, layer_size){
  
  m <- dim(x)[2]
  
  n_x <- layer_size$n_x
  n_h <- layer_size$n_h
  n_y <- layer_size$n_y
  
  a2 <- cache$a2
  a1 <- cache$a1
  w2 <- params$w2
  
  dz2 <- a2 - y
  dw2 <- 1/m * (dz2 %*% t(a1)) 
  db2 <- matrix(1/m * sum(dz2), nrow = n_y)
  db2_new <- matrix(rep(db2, m), nrow = n_y)
  
  dz1 <- (t(w2) %*% dz2) * (1 - a1^2)
  dw1 <- 1/m * (dz1 %*% t(x))
  db1 <- matrix(1/m * sum(dz1), nrow = n_h)
  db1_new <- matrix(rep(db1, m), nrow = n_h)
  
  grads <- list("dw1" = dw1, 
                "db1" = db1,
                "dw2" = dw2,
                "db2" = db2)
  
  return(grads)
  
}

update_params <- function(grads, params, learning_rate){
  
  w1 <- params$w1
  b1 <- params$b1
  w2 <- params$w2
  b2 <- params$b2
  
  dw1 <- grads$dw1
  db1 <- grads$db1
  dw2 <- grads$dw2
  db2 <- grads$db2
  
  
  w1 <- w1 - learning_rate * dw1
  b1 <- b1 - learning_rate * db1
  w2 <- w2 - learning_rate * dw2
  b2 <- b2 - learning_rate * db2
  
  updated_params <- list("w1" = w1,
                         "b1" = b1,
                         "w2" = w2,
                         "b2" = b2)
  
  return (updated_params)
  
}

train_nn <- function(x, y, iters, hidden_neurons, learning_rate){
  
  layer_size <- get_layer_size(x, y, hidden_neurons)
  initial_params <- random_params(x, layer_size)
  cost_history <- c()
  
  for (i in 1:iters) {
    fwd_prop <- forward_prop(x, initial_params, layer_size)
    cost <- get_cost(x, y, fwd_prop)
    back_prop <- backward_prop(x, y, fwd_prop, initial_params, layer_size)
    updated_params <- update_params(back_prop, initial_params, learning_rate = learning_rate)
    initial_params <- updated_params
    cost_history <- c(cost_history, cost)
    
    if (i %% 1000 == 0) cat("Iteration", i, " | Cost: ", cost, "\n")
  }
  
  model <- list("updated_params" = updated_params,
                "layer_size" = layer_size,
                "cost_hist" = cost_history)
  
  return(model)

}


predict_nn <- function(x, trained_model){
  
  fwd_prop <- forward_prop(x, trained_model$updated_params, trained_model$layer_size)
  pred <- fwd_prop$a2
  
  return(pred)
}
