# needed packages, etc.

install.packages("bookdown")

library(usethis)
library(bookdown)


install.packages("bookdown", dependencies = TRUE)
library(bookdown)
bookdown::render_book("index.Rmd", output_format = "bookdown::gitbook", output_dir = "docs",  new_session = TRUE)
?render_book()
