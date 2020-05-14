## Random Trees

## Arbol con rpart

kantar_chaid <- function(df, atr, prec=0.05){
  y <- df
  etiquetas <- sjlabelled::get_labels(df[1])[[1]]
  if(length(etiquetas)==0) etiquetas <- c("No", "Yes")
  etiquetar <- function(x) factor(x, labels = etiquetas)
  
  df <- df %>% 
    apply(2, etiquetar) %>% 
    as.data.frame()
  
  nom_var <- colnames(y)
  nom_eti <- y %>% sapply(sjlabelled::get_label)
  nom_eti <- janitor::make_clean_names(nom_eti)
  colnames(df) <- nom_eti
  titulo <- colnames(df[atr])
  
  tree_model <- rpart::rpart(stats::formula(paste0(titulo,"~.")), data = df, cp = prec)
  
  split.fun <- function(x, labs, digits, varlen, faclen){
    labs <- labs %>% as.vector()
    separados <- strsplit(labs, "")
    posiciones <- lapply(separados, 
                         function(x){
                           y <- which(x=="_")[round(length(which(x=="_"))/2)]
                           ifelse(length(y)==0, NA, y)
                         }) %>% unlist()
    
    substr(labs, posiciones, posiciones) <- "/"
    labs <- labs %>% as.list()
    gsub("/", "\n", labs)
  }
  
  rpart.plot::prp(tree_model,
                  varlen = 0,
                  type = 4,
                  extra = 6,
                  under = F,
                  fallen.leaves = T,
                  clip.right.labs = F,
                  branch.lty = 1,
                  cex = 0.6,
                  eq = ": ",
                  main = titulo,
                  compress = F,
                  box.palette = "auto",
                  split.fun = split.fun)
  
  pred <- stats::predict(tree_model, df %>% dplyr::select(-titulo), type = "class")
  
  conf_matrix <- caret::confusionMatrix(as.factor(pred), as.factor(df[,titulo]), positive = "Yes")
  
  return(conf_matrix)                                     
                                        
}

borrar <- function(){}
## Arbol con caret

