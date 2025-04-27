library(dplyr)
master$country = master$ï..country
master$gdp_per_capita = master$gdp_per_capita....
sr = master %>%
group_by(country,year)%>%
  summarize(suicides.100k.pop=sum(suicides.100k.pop),
            gdp.per.capita = mean(gdp_per_capita),
            population = sum(population))

sr$country = as.character(sr$country)

g20 = subset(sr, country == 'Argentina'|country =='Brazil'|country =='Mexico '|
               country =='Russian Federation'|country =='South Africa'|
               country =='Turkey'|country =='Australia'|country =='Canada'|
               country =='France'|country =='Germany'|country =='Italy'|country =='Japan'|
               country =='Republic of Korea'|country =='United Kingdom'|country =='United States')

library(gganimate) # for animation layer
library(gifski) # for making the animation; restart R after installing
library(gapminder) # for gapminder data about countries

p <- ggplot(g20, aes(x = gdp.per.capita, y=suicides.100k.pop, size = population, colour = country))+ 
  geom_point(show.legend = T, alpha = 0.7) + 
  scale_color_viridis_d() + 
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Suicide Rate")+
  ggtitle("G20 countries Suicide Rate vs GDP per capita (1985-2015)") +
  transition_time(year) +
  labs(title = "Year: {frame_time}")

animate(p, height = 500, width =750)