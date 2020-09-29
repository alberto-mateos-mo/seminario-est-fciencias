library(ggplot2)
library(magrittr)
library(dplyr)
library(gt)
library(glue)
library(unam.theme)

paths <- list.files("data/")

files <- lapply(paths, function(x) janitor::clean_names(read.csv(paste0("data/", x))))

m2015 <- files[[1]] %>% 
  select(country, happiness_score) %>% 
  filter(country == "Mexico") %>% 
  mutate(yr = "2015") %>% 
  rename(score = happiness_score)

m2019 <- files[[5]] %>% 
  select(country_or_region, score) %>% 
  filter(country_or_region == "Mexico") %>% 
  mutate(yr = "2019") %>% 
  rename(country = country_or_region)

mexico_hs <- rbind(m2015, m2019)

rm(m2015, m2019)


# Bar vs Text -------------------------------------------------------------

ggplot(mexico_hs, aes(yr, score, fill = "1"))+
  geom_col()+
  geom_text(aes(label = score), nudge_y = -1, colour = "white")+
  ggtitle("Happiness Score: Mexico")+
  scale_fill_unam(discrete = TRUE)+
  theme_unam()+
  theme(legend.position = "none")

ggplot()+
  geom_text(aes(x = 0.1, y = 2.5), label = "6.6", size = 40, colour = "#395D88")+
  geom_text(aes(x = -0.5, y = 1.9), label = "the", size = 14, colour = "#3EA1B2")+
  geom_text(aes(x = -0.15, y = 1.9), label = "happiness score", size = 14, colour = "#395D88")+
  geom_text(aes(x = 0.45, y = 1.9), label = "for Mexico in 2019", size = 14, colour = "#3EA1B2")+
  geom_text(aes(x = 0.1, y = 1.6), label = "Compared to a score of 7.2 in 2015 a reduction is observed.", size = 8, colour = "#74878A")+
  coord_cartesian(xlim = c(-1,1), ylim = c(0,5))+
  theme_void()


# Tables ------------------------------------------------------------------

g20 <- files[[5]] %>% 
  select(country_or_region, score, gdp_per_capita, social_support, perceptions_of_corruption) %>% 
  filter(country_or_region %in% c("Argentina", "Australia", "Brazil", "Canada", "China", "France", 
                                  "Germany", "India", "Indonesia", "Italy", "Japan", "Mexico", 
                                  "Russia", "Saudi Arabia", "South Africa", "South Korea", "Turkey", 
                                  "United Kingdom", "United States")) %>% 
  arrange(country_or_region)

g20 %>% 
  gt() %>%
  tab_header(
    title = "Happiness Score 2019",
    subtitle = "Member countries in G-20"
  ) %>% 
  fmt_number(
    columns = vars("score", "gdp_per_capita", "social_support", "perceptions_of_corruption"),
    decimals = 2,
    use_seps = TRUE
  ) %>% 
  cols_label(
    country_or_region = "Country",
    score = "Happiness Score",
    gdp_per_capita = "GDP per Capita",
    social_support = "Social Support",
    perceptions_of_corruption = "Perceptions of Corruption"
  ) %>% 
  cols_align(
    align = "center"
  ) %>%
  tab_style(
    style = cell_text(size = px(12)),
    locations = cells_body(
      columns = vars(country_or_region, score, gdp_per_capita, social_support, perceptions_of_corruption)
    )
  ) %>%
  tab_source_note(
    source_note = md(
      "The happiness scores and rankings use data from the Gallup World Poll")
  )


# Scatters ----------------------------------------------------------------

world_hs <- lapply(files, function(x){
  tmp <- x %>% 
    select(dplyr::one_of(c("generosity"), 
                         c("trust_government_corruption", "perceptions_of_corruption"))) 
  
    try(tmp <- rename(tmp, corruption = trust_government_corruption))
    try(tmp <- rename(tmp, corruption = perceptions_of_corruption)) 
  tmp %>%
    mutate(generosity = as.numeric(generosity)) %>% 
    mutate(corruption = as.numeric(corruption)) %>% 
    summarise_all(~mean(.x, na.rm = TRUE))
})

world_hs %<>% 
  bind_rows() %>% 
  mutate(yr = c("2015", "2016", "2017", "2018", "2019"))

ggplot(world_hs, aes(x = yr))+ 
  geom_line(aes(y = generosity, group = "generosity", colour = "generosity"), size = 2)+
  geom_line(aes(y = corruption, group = "corruption", colour = "corruption"), size = 2)+
  expand_limits(y = 0)+
  labs(x = "Year",y = "", title = "Relationship: Generosity and Corruption")+
  scale_color_unam()+
  theme_unam()+
  theme(legend.title = element_blank())
  
ggplot(files[[5]])+ 
  geom_point(aes(x = perceptions_of_corruption, y = generosity, colour = "generosity"))+
  labs(x = "Corruption",y = "Generosity", title = "Relationship: Generosity and Corruption")+
  scale_color_unam()+
  theme_unam()+
  theme(legend.title = element_blank(),
        legend.position = "none")


# Lines -------------------------------------------------------------------


mx_hs <- lapply(files, function(x){
  tmp <- x %>% 
    select(dplyr::one_of(c("country", "country_or_region"),
                         c("generosity"), 
                         c("score", "happiness_score"))) 
  try(tmp <- rename(tmp, country = country_or_region))
  try(tmp <- rename(tmp, score = happiness_score))
  tmp %>%
    filter(country == "Mexico") %>% 
    mutate(score = as.numeric(score))
})

mx_hs %<>% 
  bind_rows() %>% 
  mutate(yr = c("2015", "2016", "2017", "2018", "2019"))

ggplot(mx_hs)+
  geom_line(aes(x = yr, y = score, group = country), size = 2, colour = "#D05E35")+
  expand_limits(y = 0)+
  scale_colour_unam()+
  labs(title = "Happiness Score in Mexico over time")+
  theme_unam()

ggplot(mx_hs)+
  geom_col(aes(x = yr, y = score), fill = "#D05E35")+
  labs(title = "Happiness Score in Mexico over time")+
  theme_unam()


# slopes ------------------------------------------------------------------


ap2015 <- files[[1]] %>%
  filter(country %in% c("Mexico", "Peru", "Colombia", "Chile")) %>% 
  select(country, health_life_expectancy) %>% 
  rename(healthy_life_expectancy = health_life_expectancy) %>% 
  mutate(yr = "2015")

ap2019 <- files[[5]] %>% 
  filter(country_or_region %in% c("Mexico", "Peru", "Colombia", "Chile")) %>% 
  rename(country = country_or_region) %>% 
  select(country, healthy_life_expectancy) %>% 
  mutate(yr = "2019")

ap <- rbind(ap2015, ap2019)

rm(ap2015, ap2019)

ggplot(ap)+
  geom_line(aes(x = yr, y = healthy_life_expectancy, group = country, colour = country), size = 2)+
  geom_point(aes(x = yr, y = healthy_life_expectancy, group = country, colour = country), size = 4)+
  labs(x = "Year", y = "Healthy Life Expectancy", title = "Health Life Expectancy for \nPacific Alliance Countries")+
  scale_colour_unam(name = "Country")+
  theme_unam()

ggplot(ap)+
  geom_col(aes(x = yr, y = healthy_life_expectancy, group = country, fill = country), position = "dodge2")+
  labs(x = "Year", y = "Healthy Life Expectancy", title = "Health Life Expectancy for \nPacific Alliance Countries")+
  scale_fill_unam(name = "Country")+
  theme_unam()

# pseudobar ---------------------------------------------------------------


ggplot(filter(ap, yr == "2019"))+
  geom_linerange(aes(x = reorder(country, healthy_life_expectancy), ymin = 0, ymax = healthy_life_expectancy), 
                 size = 2, colour = "#490A0D")+
  geom_point(aes(x = country, y = healthy_life_expectancy), size = 4, colour = "#490A0D")+
  labs(x = "", y = "Healthy Life Expectancy", title = "Health Life Expectancy for \nPacific Alliance Countries",
       subtitle = "Year 2019")+
  scale_fill_unam(name = "Country")+
  coord_flip()+
  theme_unam()

# evil pies ---------------------------------------------------------------

ggplot(filter(ap, yr == "2019"))+
  geom_col(aes(x = yr, y = healthy_life_expectancy, fill = country), position = "fill")+
  scale_fill_unam(name = "Country")+
  coord_polar("y", start = 0)+
  theme_void()

ggplot(filter(ap, yr == "2019"))+
  geom_col(aes(x = 2, y = healthy_life_expectancy, fill = country), position = "fill")+
  scale_fill_unam(name = "Country")+
  xlim(0.5, 2.5)+
  coord_polar("y", start = 0)+
  theme_void()
