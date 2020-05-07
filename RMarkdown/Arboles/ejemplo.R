require(dplyr)
require(caret)

datos <- haven::read_sav("C:/Users/David Alberto MMO/Documents/Ayudantias/2020-2/dontshare/stacked_anonimizada.sav")
datos <- datos %>% 
  select(contains("Atributo"))

kantar_chaid(datos, 9, 0.01)
