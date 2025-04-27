# Chicago Crash Heatmap

## Overview
Spatial heatmap of car crashes in Chicago during June 2019, analyzed by different lighting conditions (Dawn, Daylight, Dusk, Darkness).

## Visualization Details
- Base Map: Stamen terrain tiles
- Density Estimation: stat_density_2d with binning
- Faceting: One map per lighting condition

## Technology Stack
- R: ggplot2, ggmap, dplyr, RColorBrewer
- Suitable for showing geographic intensity variation across categories.

## Data Source
- Chicago Open Data Portal (https://data.cityofchicago.org/Transportation/Traffic-Crashes-Crashes/85ca-t3if)

## Files
- `chicago_crash_heatmap.png`: Generated heatmap.
- `heatmap_code.R`: Full R script for map generation and faceting.
