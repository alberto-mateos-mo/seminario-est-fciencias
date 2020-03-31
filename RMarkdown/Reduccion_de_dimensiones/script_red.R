require(dplyr)
require(ggplot2)
require(unam.theme)

datos <- read.csv("RMarkdown/Reduccion_de_dimensiones/train.csv")

head(datos[,1:10])

datos <- datos %>% 
  select(-label)

rand_number <- matrix(as.matrix(datos[100,]), nrow = 28)

heatmap(x = rand_number, Colv = NA, Rowv = NA, revC = F, scale = "none", col = grey.colors(1000))

rand_pixel <- matrix(as.matrix(datos[,200]), nrow = 210)

heatmap(x = rand_pixel, Colv = NA, Rowv = NA, revC = F, scale = "none", col = grey.colors(1000))

compo <- prcomp(datos, center = TRUE, scale. = F, rank. = 80, retx = TRUE)

summary(compo)

cumpro <- data.frame(pc = 1:80, cumvar = cumsum(compo$sdev^2/sum(compo$sdev^2))[1:80])

ggplot(cumpro, aes(pc, cumvar))+
  geom_line()+
  geom_point()+
  labs(x = "Componente", y = "Varianza acumulada")+
  theme_unam()

i <- 1

kk <- matrix(compo$rotation[,i], nrow = 28)

heatmap(kk, Colv = NA, Rowv = NA, revC = F, scale = "none", col = grey.colors(1000))
