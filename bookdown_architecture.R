# a script with the packages and code needed to build the bookdown book

# loading packages
  # libraries needed
  libs <- c("knitr", "usethis", "bookdown","rmarkdown")
  
  # install missing libraries
  installed_libs <- libs %in% rownames(installed.packages())
  if (any(installed_libs == F)) {
    install.packages(libs[!installed_libs])
  }
  
  # load libraries
  lapply(libs, library, character.only = T)


# the function used to compile the book, run before commiting
render_book("index.Rmd", output_format = "bookdown::gitbook", output_dir = "docs",  new_session = TRUE)

print("done")