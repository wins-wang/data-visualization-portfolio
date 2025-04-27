library(ggmap)
library(ggplot2)
library(dplyr)

chi_bb <- c(left = -87.936287,
            bottom = 41.679835,
            right = -87.447052,
            top = 42.000835)

chicago_stamen <- get_stamenmap(bbox = chi_bb,
                                zoom = 11)
Chicago = chicago_stamen


ggmap(Chicago) +
  stat_density_2d(data = chicago_crashes %>%
                    filter(`LIGHTING_CONDITION` %in% c("DAWN","DAYLIGHT","DUSK","DARKNESS", "DARKNESS, LIGHTED ROAD","UNKNOWN")),
                  aes(x = LONGITUDE,
                      y = LATITUDE,
                      fill = stat(level)),
                  alpha = .4,
                  bins = 10,
                  geom = "polygon") +
  scale_fill_gradientn(colors = brewer.pal(7, "YlOrRd")) +
  facet_wrap(~ `LIGHTING_CONDITION`) +
  labs(x="Longtitude",y = "Latitude")+
  ggtitle("Car Crash in Chicago June 2019","Frequency under different time period") 
