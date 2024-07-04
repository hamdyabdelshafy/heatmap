### Heatmap Generation and Plotting

### Author: Hamdy Abdel-Shafy
### Date: July 2024
### Affiliation: Department of Animal Production, Cairo University, Faculty of Agriculture

## This code demonstrates how to generate and plot heatmaps for bile acid classes and individual bile acids using simulated data. 
## The heatmaps are plotted side by side and saved as an image file.


# Install the following R packages if you haven't already:

install.packages("pheatmap")
install.packages("gridExtra")
install.packages("grid")

# Load necessary libraries
library(pheatmap)
library(gridExtra)
library(grid)

# Import the simulated data from CSV files
ba_classes <- as.matrix(read.csv("ba_classes.csv", row.names = 1))
individual_ba <- as.matrix(read.csv("individual_ba.csv", row.names = 1))

# Convert data frames to numeric matrices if necessary
ba_classes <- apply(ba_classes, 2, as.numeric)
individual_ba <- apply(individual_ba, 2, as.numeric)

# Verify data import
print(ba_classes)
print(individual_ba)


# Define annotation for columns
annotation_col <- data.frame(
  Type = factor(rep(c("Cheese", "Probiotic strains", "Reference strains", 
                      "Sourdough", "Table olives", "Untreated"), 
                    length.out = 20))
)
rownames(annotation_col) <- colnames(ba_classes)

# Define annotation colors
annotation_colors <- list(
  Type = c(Cheese = "yellow", `Probiotic strains` = "orange", 
           `Reference strains` = "blue", Sourdough = "red", 
           `Table olives` = "green", Untreated = "white")
)

# Plot heatmap for bile acid classes (a)
heatmap_a <- pheatmap(ba_classes, 
                      cluster_rows = TRUE, cluster_cols = TRUE, 
                      annotation_col = annotation_col, 
                      annotation_colors = annotation_colors, 
                      color = colorRampPalette(c("blue", "white", "red"))(50),
                      main = "Bile Acid Classes", silent = TRUE)

# Plot heatmap for individual bile acids (b)
heatmap_b <- pheatmap(individual_ba, 
                      cluster_rows = TRUE, cluster_cols = TRUE, 
                      annotation_col = annotation_col, 
                      annotation_colors = annotation_colors, 
                      color = colorRampPalette(c("blue", "white", "red"))(50),
                      main = "Individual Bile Acids", silent = TRUE)

# Arrange the two heatmaps side by side
combined_plot <- grid.arrange(heatmap_a$gtable, heatmap_b$gtable, ncol = 2)

# Save the combined plot as an image file
png("combined_heatmap.png", width = 14, height = 7, units = "in", res = 300)
grid.draw(combined_plot)
dev.off()
