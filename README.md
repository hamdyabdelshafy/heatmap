### Heatmap Generation and Plotting

### Author: Hamdy Abdel-Shafy
### Date: July 2024
### Affiliation: Department of Animal Production, Cairo University, Faculty of Agriculture

# This project demonstrates how to generate and plot heatmaps for bile acid classes and individual bile acids using simulated data. 
# The heatmaps are plotted side by side and saved as an image file.

## Prerequisites

Make sure you have R installed on your system. You also need to install the following R packages if you haven't already:

install.packages("pheatmap")
install.packages("gridExtra")
install.packages("grid")

## Data Preparation

Before running the plotting script, you need to have the simulated data saved in CSV files. 
If you don't have these files yet, you can generate and save them using the following code:

# Generate simulated data for bile acid classes (a)
ba_classes <- matrix(rnorm(200), nrow = 10, ncol = 20)
rownames(ba_classes) <- c("Hydrophilic BA", "Tauro BA", "Total BA", "Free BA", 
                          "Conjugated BA", "Glyco BA", "Hydrophobic BA", 
                          "Primary BA", "Secondary BA", "Other BA")
colnames(ba_classes) <- paste0("Strain", 1:20)

# Generate simulated data for individual bile acids (b)
individual_ba <- matrix(rnorm(400), nrow = 20, ncol = 20)
rownames(individual_ba) <- make.unique(c("THDCA", "TDCA", "TMCA", "THCA", "TCA", "HCA", 
                             "TDCA", "7-KCA", "MuCA", "UDCA", "TUDCA", "TDCA", 
                             "CA", "a/b-MCA", "p-MCA", "DCA", "PDCA", "TUDA", 
                             "GLUDCA", "TUDCA"))
colnames(individual_ba) <- paste0("Strain", 1:20)

# Save the simulated data to CSV files
write.csv(ba_classes, "ba_classes.csv", row.names = TRUE)
write.csv(individual_ba, "individual_ba.csv", row.names = TRUE)



## Explanation for the provided r code (heatmap_imported_Data.r)

1. **Load Necessary Libraries**:
   The script begins by loading the required libraries for creating heatmaps and arranging plots.

2. **Import Simulated Data**:
   The script reads the simulated data from previously saved CSV files and converts them into matrices.

3. **Verify Data Import**:
   The imported data is printed to ensure it has been read correctly.

4. **Define Annotations**:
   Column annotations are defined to categorize the data into different types, such as "Cheese", "Probiotic strains", etc. Colors are assigned to each category.

5. **Plot Heatmaps**:
   Heatmaps are generated for bile acid classes and individual bile acids using the `pheatmap` function. Clustering is performed on both rows and columns.

6. **Arrange Heatmaps**:
   The two heatmaps are arranged side by side using the `grid.arrange` function from the `gridExtra` package.

7. **Save the Combined Plot**:
   The combined plot is saved as a PNG image file using the `png` function and `grid.draw` to render the plot.

## Conclusion

This project provides a simple example of how to generate and visualize heatmaps using simulated data. 
The steps are well-documented to help beginners understand the process and reproduce the results.

Feel free to modify the code and experiment with different datasets and visualization options.


## License

This project is licensed under the [MIT License](LICENSE).
