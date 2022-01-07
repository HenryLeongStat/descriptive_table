###
# Loading
#data(mtcars)

## check a variable type
var_type <- NULL
for(i in 1:dim(mtcars)[2]){
  # check if it is less than some number, then it is a binary/nominal but coded as continuous(numeric)
  unique_vec <- unique(mtcars[,i])
  if(class(unique_vec) == "character" || unique_vec == "factor"){
    if(length(unique_vec)>10){
      note <- "More than 10 unique outputs, only show the top 10"
      list_unique <- sort(table(mtcars[,i]), decreasing = TRUE)[1:10]
    } else {
      list_unique <- sort(table(mtcars[,i]), decreasing = TRUE)
    }
  } else if(class(unique_vec)=="numeric"){
    list_unique <- c(summary(mtcars[,i]), "SD"=sd(mtcars[,i]))
  }
}
