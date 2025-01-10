# a script with the packages and code needed to build the bookdown book

# packages for book making
install.packages(c("knitr", "usethis", "bookdown"))
install.packages(c("rmarkdown"))

library(usethis)
library(bookdown)
library(knitr)
library(rmarkdown)
# the function used to compile the book, run before commiting
render_book("index.Rmd", output_format = "bookdown::gitbook", output_dir = "docs",  new_session = TRUE)
print("done")