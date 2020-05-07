require(jpeg)
require(ggplot2)
require(plot3D)
require(dplyr)
require(factoextra)


img <- readJPEG("RMarkdown/Clustering/example1/fishes.jpg")

dim(img)

img_df <- data.frame(
  x = rep(1:dim(img)[2], each = dim(img)[1]),
  y = rep(dim(img)[1]:1, dim(img)[2]),
  R = as.vector(img[,,1]),
  G = as.vector(img[,,2]),
  B = as.vector(img[,,3])
)

n <- 8 # change this

k <- kmeans(img_df[,c("R", "G", "B")], centers = n)

kColours <- rgb(k$centers[k$cluster,])

img_df$col <- k$cluster

scatter3D(x = img_df$R, y = img_df$G, z = img_df$B, colvar = as.integer(img_df$col), 
          col = unique(kColours), 
          main = paste(n, "group k-means clustering"), xlab = "Red", ylab = "Green", zlab = "Blue")

# plot_ly(tmp, x = ~R, y = ~G, z = ~B) %>% 
#   add_markers(color = ~col3, colors = unique(kColours3))

fviz_cluster(k, data = img_df, ggtheme = theme_minimal())+
  scale_colour_manual(values = unique(kColours))+
  scale_fill_manual(values = unique(kColours))

ggplot(data = img_df, aes(x = x, y = y)) + 
  geom_point(colour = kColours) +
  labs(title = paste(n, "group k-means image")) +
  theme_minimal()
