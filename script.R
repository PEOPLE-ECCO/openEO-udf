# Load the stars package
library(stars)

# Define a function to process a stars data cube
process_stars_cube <- function(stars_cube, operation = "scale", factor = 1) {
  # Check if the input is a stars object
  if (!inherits(stars_cube, "stars")) {
    stop("Input must be a stars object.")
  }
  
  # Perform the requested operation
  if (operation == "scale") {
    # Scale the data cube by the given factor
    result_cube <- stars_cube * factor
  } else if (operation == "normalize") {
    # Normalize the data cube to have values between 0 and 1
    min_val <- min(stars_cube[[1]], na.rm = TRUE)  # Access the first attribute of the stars object
    max_val <- max(stars_cube[[1]], na.rm = TRUE)
    result_cube <- (stars_cube - min_val) / (max_val - min_val)
  } else if (operation == "log") {
    # Apply log transformation (adding 1 to avoid log(0))
    result_cube <- log(stars_cube + 1)
  } else {
    stop("Unsupported operation. Choose 'scale', 'normalize', or 'log'.")
  }
  
  # Return the modified stars data cube
  return(result_cube)
}