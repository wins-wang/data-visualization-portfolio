library(mapproj)
library(ggplot2)
library(dplyr)
library(scales)

# Read Tab-separated txt file
FoodSrvcByCounty <- read.delim('data/FoodSrvcByCounty.txt')

# create Food services by State and by County data
FoodState = FoodSrvcByCounty[-grep('\\w+',FoodSrvcByCounty$State),]
FoodState$County = tolower(FoodState$County)

FoodCounty = FoodSrvcByCounty[grep('\\w+',FoodSrvcByCounty$State),]

#Converting abbreviation to state name for map joining 

#'x' is the column of a data.frame that holds 2 digit state codes
stateFromLower <-function(x) {
  #read 52 state codes into local variable [includes DC (Washington D.C. and PR (Puerto Rico)]
  st.codes<-data.frame(
    state=as.factor(c(" AK", " AL", " AR", " AZ", " CA", " CO", " CT", " DC", " DE", " FL", " GA",
                      " HI", " IA", " ID", " IL", " IN", " KS", " KY", " LA", " MA", " MD", " ME",
                      " MI", " MN", " MO", " MS",  " MT", " NC", " ND", " NE", " NH", " NJ", " NM",
                      " NV", " NY", " OH", " OK", " OR", " PA", " PR", " RI", " SC", " SD", " TN",
                      " TX", " UT", " VA", " VT", " WA", " WI", " WV", " WY")),
    full=as.factor(c("alaska","alabama","arkansas","arizona","california","colorado",
                     "connecticut","district of columbia","delaware","florida","georgia",
                     "hawaii","iowa","idaho","illinois","indiana","kansas","kentucky",
                     "louisiana","massachusetts","maryland","maine","michigan","minnesota",
                     "missouri","mississippi","montana","north carolina","north dakota",
                     "nebraska","new hampshire","new jersey","new mexico","nevada",
                     "new york","ohio","oklahoma","oregon","pennsylvania","puerto rico",
                     "rhode island","south carolina","south dakota","tennessee","texas",
                     "utah","virginia","vermont","washington","wisconsin",
                     "west virginia","wyoming"))
  )
  #create an nx1 data.frame of state codes from source column
  st.x<-data.frame(state=x)
  #match source codes with codes from 'st.codes' local variable and use to return the full state name
  refac.x<-st.codes$full[match(st.x$state,st.codes$state)]
  #return the full state names in the same order in which they appeared in the original source
  return(refac.x)
  
}
# convert all characters into lowercase 
FoodCounty$County = tolower(FoodCounty$County)
FoodCounty$States = stateFromLower(FoodCounty$State)


# create state long and lat data and put it with Food by state data
states_map <- map_data("state")
Food_StateMap <- left_join(states_map, FoodState,
                       by = c("region" = "County") ) 

# Plot the state map

ggplot(Food_StateMap, aes(x = long, y = lat, group = group, fill = FoodServices.97)) +
  geom_polygon(colour = "Black") + 

  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +

  labs(x="Longtitude",y = "Latitude", title = "Food Services in the U.S. 1997", fill = "Services Amount") +

  scale_fill_gradient2(low = "blue", mid = "white",
                       high = "red", name = "Services Amount",space = "Lab",
                       midpoint = median(FoodState$FoodServices.97))


# create county long and lat data and put it with Food by state data
county_map <- map_data("county")

Food_CountyMap <- left_join(county_map, FoodCounty,
                          by = c("subregion"= "County","region" = "States") )
# create a log transformation 
Food_CountyMap$FoodServices.2007_scale = log(Food_CountyMap$FoodServices.2007+1) 

# plot the county map
ggplot(Food_CountyMap, aes(x = long, y = lat, group = group, fill = FoodServices.2007_scale)) +
  geom_polygon(colour = "Black",size = .3) + 
  
  coord_map(projection = "albers", lat0 = 39, lat1 = 45) +
  
  labs(x="Longtitude",y = "Latitude", title = "Food Services in the U.S. 2007", fill = "Services Scale") +
  scale_fill_gradient(
    high = "red",
    low = "yellow", space = "Lab",  guide = "colourbar",
    aesthetics = "fill") 



install.packages('rgdal')
library(sf)
library(cartogram)
library(rgdal)
usMap = readOGR('data/USA.shp')
usMap$NAME_1
States = subset(FoodState,County != 'ALASKA'&County !='DISTRICT OF COLUMBIA'&
                  County !='District of Columbia'& County !='UNITED STATES')
usMap$FoodService = States$FoodServices.2002

sfno = st_as_sf(usMap)
sfproj = st_transform(sfno,crs= 6923)
food02 = cartogram_cont(sfproj, weight = "FoodService")
ggplot()+
  geom_sf(data = food02,aes(fill=FoodService))+
  geom_polygon()+
  labs(x="Longtitude",y = "Latitude", title = "Cartogram of Food Services in the U.S. 2002", fill = "Services Amount")+
  scale_fill_gradient2(low = "blue", mid = "white",
                     high = "red", name = "Services Amount",space = "Lab",
                     midpoint = median(usMap$FoodService))
