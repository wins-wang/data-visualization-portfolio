# Perception Error Analysis

## Overview
Statistical analysis and visualization of a perception experiment testing human accuracy in decoding different types of visual encodings (position, length, angle, area, color, and volume).

## Visualization Details
- Raincloud plots for error distributions across encoding types.
- Anomaly detection through subject response patterns.

## Technology Stack
- R: ggplot2, cowplot, dplyr
- Raincloud plots effectively display both distribution density and variability.
- Suitable for visualizing experimental results and identifying outliers.

## Data Source
- Provided through DSC465 Data Visualization course at DePaul University.
- Data measures participants' deviation from true encoded values.

## Files
- `perception_raincloud.png`: Distribution of absolute errors.
- `perception_anomalous.png`: Response anomalies visualization.
- `perception_code.R`: Full R script for analysis and plotting.
