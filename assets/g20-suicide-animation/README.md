# G20 Suicide Rate Animation

## Overview
An animated bubble plot illustrating the relationship between GDP per capita and suicide rates across G20 countries from 1985 to 2015. The animation dynamically shows changes over time, while bubble size represents the total population of each country.

## Visualization Details
- X-axis: GDP per capita (log-scaled)
- Y-axis: Suicide rate (per 100,000 population)
- Bubble Size: Country population
- Bubble Color: Country identity
- Animation: Frame-by-frame progression over years 1985–2015

## Technology Stack
- R: ggplot2, gganimate, gifski, viridis
- Animation suitable for showing time-based multivariate trends.

## Data Source
- Suicide and economic data compiled from public sources and Kaggle datasets.
- Dataset includes suicide rates, GDP per capita, and population figures.

## Files
- `g20_suicide_animation.gif`: Animated bubble plot.
- `animation_code.R`: R code for data preprocessing and animation generation.
