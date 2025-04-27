# 📊 Data Visualization Portfolio

A curated collection of data visualization projects demonstrating diverse techniques across geospatial analysis, statistical distribution visualization, interactive dashboards, categorical data representation, and animated storytelling.

Each project showcases different visualization approaches and highlights how specific techniques are suited for different types of data insights.

---

## 🔹 Projects

- [G20 Suicide Rate Animation](./g20-suicide-animation/)  
  Animated bubble plot showing suicide rates vs. GDP per capita across G20 countries (1985–2015).

- [G20 Interactive Dashboard](./g20-dashboard/)  
  Interactive Tableau dashboard exploring suicide rates and GDP growth among G20 nations over three decades.

- [Perception Error Analysis](./perception-error-analysis/)  
  Raincloud plots and anomaly detection based on a perception experiment dataset.

- [Messier Objects Exploration](./messier-objects-exploration/)  
  Scatter plot visualizing the relationship between distance, brightness, and angular size of Messier astronomical objects.

- [Food Service Geovisualization](./foodservice-geovisualization/)  
  Geographical mapping and cartogram-based distortion of food service availability across U.S. states and counties.

- [Categorical Visualizations](./categorical-visualizations/)  
  Treemap and bubble charts demonstrating categorical data visualization using car price datasets.

- [Chicago Crash Heatmap](./chicago-crash-heatmap/)  
  Heatmap visualizing the frequency of car crashes in Chicago across different lighting conditions.

---

## 🛠️ Visualization Techniques Overview

| Technique | Description | Suitable For |
|:----------|:------------|:-------------|
| **Animated Bubble Plot** (`gganimate`) | Dynamic visualization showing changes over time using position, size, and color encoding. | Time series trends across multiple variables. |
| **Interactive Dashboard** (`Tableau`) | User-driven exploration with filters, selectors, and linked views. | When users need flexible, multi-perspective data exploration. |
| **Raincloud Plot** (`ggplot2`, `cowplot`) | Combination of violin plot, boxplot, and jittered scatterplot. | Visualizing full distribution, density, and spread of data. |
| **Cartogram** (`cartogram`, `sf`) | Geographical distortion where area represents a data attribute rather than physical size. | When geographical size misleads data interpretation; emphasize magnitude. |
| **Choropleth Map** (`ggplot2`, `mapproj`) | Coloring regions based on data values. | Standard for showing geographical distribution. |
| **Heatmap with Faceting** (`ggmap`, `ggplot2`) | Density-based color mapping over geographic coordinates, split by categorical variables. | Spatial intensity analysis across conditions. |
| **Scatter Plot with Size Encoding** (`Tableau`) | Position plus size encoding to add a third dimension to 2D plots. | Multivariate numerical data. |
| **Treemap** (`Tableau`) | Hierarchical space-filling visualization showing proportions. | Comparing parts of a whole across two categorical levels. |
| **Bubble Chart** (`Tableau`) | Circles sized and colored by variables for categorical comparison. | Loose grouping and sizing by magnitude for categories. |

---

## 📚 Datasets Used

| Dataset | Description | Source |
|:--------|:------------|:-------|
| **G20 Suicide Rate Dataset** | Suicide rates, GDP per capita, and population for G20 countries (1985–2015). | Public datasets from Kaggle and open statistical repositories. |
| **Perception Experiment Dataset** | Experimental results measuring visual decoding accuracy across different encoding methods. | Provided as part of DSC465 Data Visualization course at DePaul University. |
| **Messier Object Catalog** | Astronomical catalog listing object types, distances, magnitudes, and angular sizes. | Public astronomical data (Messier Catalog). |
| **Food Service Availability Data** | Availability of food service establishments by U.S. state and county. | U.S. Census Bureau and public shapefile repositories. |
| **Chicago Car Crash Data** | Geolocated crash incidents in Chicago during June 2019, with lighting condition metadata. | Chicago Open Data Portal. |
| **GM Car Price Dataset** | Car make, model, and sale price data for different vehicle types. | Educational dataset used in coursework. |

---

## 📝 Notes

- All datasets were used solely for educational, learning, and portfolio demonstration purposes.
- Some visualizations (e.g., cartogram) involve data transformation and re-projection for enhanced insight delivery.
