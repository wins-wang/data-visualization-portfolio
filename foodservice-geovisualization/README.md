# Food Service Geovisualization

## Overview
Comprehensive mapping of food service establishment distributions across U.S. states and counties. Includes both traditional choropleth maps and cartogram transformations to highlight disparities.

## Visualization Details
- Choropleth Map by State: Food services per state (divergent color scale, median-centered).
- Choropleth Map by County: Log-transformed food service distribution.
- Cartogram: States resized based on food service quantity.

## Technology Stack
- R: ggplot2, dplyr, cartogram, sf, mapproj
- Cartograms effectively reveal hidden disparities not apparent in traditional maps.
- Suitable for spatial and magnitude-based geographic storytelling.

## Data Source
- U.S. Census Bureau public datasets.
- Shapefiles obtained from public open data repositories.

## Files
- `foodservice_map_states.png`: State-level choropleth map.
- `foodservice_map_counties.png`: County-level choropleth map.
- `foodservice_cartogram.png`: Distorted cartogram map.
- `foodservice_code.R`: R code for data merging, processing, and plotting.
- `data/`: Includes:
  - `FoodSrvcByCounty.txt`
  - `USA.shp`, `USA.shx`, `USA.dbf`, `USA.prj`
