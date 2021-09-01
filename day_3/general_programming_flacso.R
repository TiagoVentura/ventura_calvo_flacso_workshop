## ----setup, include=FALSE----------------------------------------------------------------------------------------
options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(messagwese=FALSE, warning = FALSE)
xaringanthemer::style_mono_accent(base_color ="#23395b", 
                                  title_slide_text_color="#23395b", 
                                  title_slide_background_color = "#fbf9f4", 
                                  background_color = "#fbf9f4", 
                                  link_color =  "#F21A00", 
                                  code_font_size = "60%")

options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(message=FALSE, warning = FALSE, error=TRUE, cache=TRUE)



## ----------------------------------------------------------------------------------------------------------------
if (condition) {
  # Code executed when condition is TRUE
} else {
  # Code executed when condition is FALSE
}


## ----------------------------------------------------------------------------------------------------------------
year=2022

if(year>2021){
  print("Virtual Flacso -> Tiago is not Travelling to Mexico")
} else{
  print("In person Flacso -> Please, invite me to teach this course again!!!")
}


## ----------------------------------------------------------------------------------------------------------------
year=2023

if(year==2022){
  print("Virtual Flacso -> Tiago is not Travelling to Mexico")
} else{
  print("In person Flacso -> Please, invite me to teach this course again!!!")
}


## ----------------------------------------------------------------------------------------------------------------
year=2020

if(year==2022|year==2021){
  print("Virtual Flacso -> Tiago is not Travelling to Mexico")
} else if(year>2022){
  print("In person Flacso -> Please, invite me to teach this course again!!!")
} else if (year <2021){
  print("In person Flacso -> but sorry Tiago, we cannot come back on time")
}



## ----------------------------------------------------------------------------------------------------------------
year="2020"

if(year==2022|year==2021){
  print("Virtual Flacso -> Tiago is not Travelling to Mexico")
} else if(year>2022){
  print("In person Flacso -> Please, invite me to teach this course again!!!")
} else{
  print("Your input is wrong. Or you want to come back on time")
}




## ----------------------------------------------------------------------------------------------------------------

places_with_ilcss <- c("Buenos Aires",
                       "College Park", 
                       "Mexico City")

# for loop

for(cities in places_with_ilcss){ #iterador
  # repeating
  print(cities)
}



## ----------------------------------------------------------------------------------------------------------------
cities <- places_with_ilcss[1]
print(cities)


## ----------------------------------------------------------------------------------------------------------------
cities <- places_with_ilcss[2]
print(cities)


## ----------------------------------------------------------------------------------------------------------------
cities <- places_with_ilcss[3]
print(cities)


## ----------------------------------------------------------------------------------------------------------------
##devtools::install_github("apreshill/bakeoff")
library(bakeoff)
data("ratings_seasons")


## ----------------------------------------------------------------------------------------------------------------
# How many Seasons?
temporadas <- unique(ratings_seasons$series)
temporadas

# Average Views

#Temporadas
temporada_1 <- ratings_seasons[ratings_seasons$series==temporadas[1],]
temporada_2 <- ratings_seasons[ratings_seasons$series==temporadas[2], ]
temporada_3 <- ratings_seasons[ratings_seasons$series==temporadas[3], ]

# Take the mean

mean(temporada_1$viewers_7day)



## ----------------------------------------------------------------------------------------------------------------

# Containes
container <- list()

for(i in 1:length(temporadas)){ # Step  1
  
 # step 2  
 temp=ratings_seasons[ratings_seasons$series==temporadas[i], ] 
 
 # Step 3
 container[[i]] <- mean(temp$viewers_7day)  
  
}
container


## ----------------------------------------------------------------------------------------------------------------
x<- c(1, 2, 3, 4, 5)

# Mathematical Functions in R
sum(x, na.rm = TRUE) 
log(x) 
sqrt(x)
mean(x)



## ----eval=FALSE--------------------------------------------------------------------------------------------------
## # Lets see how the mean function works
## ?mean


## ----------------------------------------------------------------------------------------------------------------
some_me <- function( argument1, argument2 ){
  
  value <- argument1 + argument2
  
  return(value) # "return" define the output 
}

some_me(2,3)
some_me(100,123)
some_me(60,3^4)



## ----eval=FALSE--------------------------------------------------------------------------------------------------
## nome_da_funcao <- function(x,y,z){ ## Argumentos
##   ### Corpo: o que a função faz
##    	
##     out <- what the function does.
## 
##   ### Conclui Corpo.
## 
##   	return(out) ## output
## }
##   ## fecha a função
## 


## ----------------------------------------------------------------------------------------------------------------

# create a dir
dir.create("fake_data")

for(i in 1:10){
d <- tibble(n=1000, 
            norm=rnorm(n, 0, 1), 
            unif=runif(n, 0,1))
write.csv(d, paste0("fake_data/data", i,".csv"))
}



## ----------------------------------------------------------------------------------------------------------------
# create container
data <- list()

# iterator
path=paste0("./fake_data/", list.files("./fake_data"))

# the loop
for(i in 1:length(path)){
data[[i]] <- read.csv(path[[i]])  
}
str(data, 1)


## ----------------------------------------------------------------------------------------------------------------
# simple map = output is a list
l <- map(path, read.csv)

# and some extensions
l <- map_dfr(path, read.csv)

# Check
glimpse(l)


## ----------------------------------------------------------------------------------------------------------------
# Create a List
lista1 <- list(a=rnorm(1000, 0, 1),
               b=rnorm(1000, 1, 1), 
               c=rnorm(1000, 10, 1))


# Apply a function to all the elements of a list
map(lista1, mean)

# same  as:
mean(lista1$a)
mean(lista1$b)
mean(lista1$c)



## ----------------------------------------------------------------------------------------------------------------
map_df(lista1, mean)


## ----------------------------------------------------------------------------------------------------------------
# With tilde
map(lista1, ~ log(abs(sum(.x))) + 100)

# With anonymous functions 
map(lista1, function(x) log(abs(sum(x))) + 100)


