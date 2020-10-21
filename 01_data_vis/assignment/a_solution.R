library(ggplot2)
library(gghighlight)
library(dplyr)
library(leaflet)

delitos <- read.csv("carpetas-de-investigacion-pgj-de-la-ciudad-de-mexico.csv", encoding = "UTF-8")

# table(iconv(delitos$delito, from = "UTF-8", to='ASCII//TRANSLIT'))

# delitos$delito <- stringr::str_replace_all(delitos$delito, "Ã“", "O")

# fechas <- lubridate::ymd(stringr::str_sub(delitos$fecha_hechos, start = 1, end = 10))

# df <- as.data.frame(table(fechas))

# ggplot(df)+
#   geom_line(aes(lubridate::ymd(fechas), Freq), size = 1, colour = "#2A2335")+
#   scale_x_date(date_breaks = "month", date_labels = "%b")+
#   unam.theme::theme_unam()

kk <- delitos %>% 
  group_by(fiscalia, mes_hechos) %>% 
  count() %>% 
  arrange(desc(n))

kk$mes_hechos <- factor(kk$mes_hechos, levels = c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto"))

kk$fiscalia <- as.factor(kk$fiscalia)

kk$internet <- ifelse(kk$fiscalia == "UNIDAD DE RECEPCIÓN POR INTERNET", 1, 0)

ggplot(kk)+
  geom_line(aes(mes_hechos, n, group = fiscalia, colour = as.factor(internet)), size = 1.5)+
  geom_label(data = data.frame(x = 5.94514632616535, y = 1573.58376500721, 
                               label = "Unidad de recepción por internet"), 
             mapping = aes(x = x, y = y, label = label), size = 3.86605783866058, 
             label.padding = unit(0.25, "lines"), label.r = unit(0.15, "lines"), inherit.aes = FALSE)+
  scale_colour_manual(values = c("#E5E5EB", "#312E63"))+
  labs(x = "", y = "")+
  unam.theme::theme_unam()+
  theme(legend.position = "none")

kk <- delitos %>% 
  group_by(mes_hechos) %>% 
  count()

kk$mes_hechos <- factor(kk$mes_hechos, levels = c("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto"))

ggplot(kk)+
  geom_line(aes(mes_hechos, n, group = 1), colour = "#312E63", size = 1)+
  geom_point(aes(mes_hechos, n), colour = "#312E63", size = 1.5)+
  geom_rect(data = data.frame(xmin = 0.94785641607687,
                              xmax = 3.1888282973427,
                              ymin = 17015.298579324,
                              ymax = 20681.735611505),
            mapping = aes(xmin = xmin,
                          xmax = xmax,
                          ymin = ymin,
                          ymax = ymax),
            size = 0L,
            colour = "#65628A", fill = "#B2B1C4",
            alpha = 0.25,
            inherit.aes = FALSE)+
  geom_label(data = data.frame(x = 2.1,
                               y = 15000,
                               label = "Meses con mayor \ncantidad de registros"),
             mapping = aes(x = x,
                           y = y,
                           label = label),
             size = 3.86605783866058,
             label.padding = unit(0.25,
                                  "lines"),
             label.r = unit(0.15,
                            "lines"),
             inherit.aes = FALSE)+
  expand_limits(y = 0)+
  unam.theme::theme_unam()

test <- delitos %>% 
  group_by(latitud, longitud) %>% 
  filter(!is.na(latitud)) %>% 
  filter(!is.na(longitud)) %>% 
  count() %>% 
  head(50)

leaflet(test) %>% 
  addTiles() %>% 
  addMarkers(lat = ~latitud, lng = ~longitud, 
             popup = ~as.character(n))

