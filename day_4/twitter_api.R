


## ---------------------------------------------------------------------------------------------------------------

#devtools::install_github("ropensci/rtweet", force=TRUE)
#install.packages("rtweet") # somente uma vez
library(rtweet)
library(tidyverse)
library(broom)


## ---- eval=FALSE------------------------------------------------------------------------------------------------
## vignette("auth", package = "rtweet")


## ----eval=FALSE-------------------------------------------------------------------------------------------------
## app_name<-"Tiago Ventura"
## 
## consumer_key="X"
## consumer_secret="X"
## access_token<- "X"
## access_token_secret<-"X"


## ---------------------------------------------------------------------------------------------------------------
create_token(app=app_name,
             consumer_key=consumer_key, 
             consumer_secret=consumer_secret,
             access_token = access_token, 
             access_secret = access_token_secret)




## ---------------------------------------------------------------------------------------------------------------
bolsonaro_tweets<-search_tweets("bolsonaro", n=50, include_rts = TRUE)
bolsonaro_tweets %>% as_tibble()


## ---------------------------------------------------------------------------------------------------------------
timelines_covid <- get_timelines(c("renancalheiros", "ottoalencar", "EduGiraoOficial"), n=100)
timelines_covid %>% as_tibble()


## ---------------------------------------------------------------------------------------------------------------

users <- lookup_users(c("renancalheiros", "ottoalencar", "EduGiraoOficial"))

users %>%as_tibble()


## ---------------------------------------------------------------------------------------------------------------
favs <- get_favorites(c("renancalheiros", "ottoalencar", "EduGiraoOficial"))
favs %>% as_tibble()


## ---------------------------------------------------------------------------------------------------------------

follow_renan <- get_followers("renancalheiros")
follow_renan %>% as_tibble()


## ---------------------------------------------------------------------------------------------------------------
election <- stream_tweets("", 
                          timeout = 100, 
                          file_name = "file.json")
election


