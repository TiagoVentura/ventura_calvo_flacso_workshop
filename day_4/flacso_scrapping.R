## ----setup, include=FALSE---------------------------------------------------------------------------------------

options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(messagwese=FALSE, warning = FALSE)
xaringanthemer::style_mono_accent(base_color ="#23395b", 
                                  title_slide_text_color="#23395b", 
                                  title_slide_background_color = "#fbf9f4", 
                                  background_color = "#fbf9f4", 
                                  link_color =  "#F21A00", 
                                 code_font_size = "60%")

options(htmltools.dir.version = FALSE)
knitr::opts_chunk$set(message=FALSE, warning = FALSE, error=TRUE)




## ----knitr_init, echo=FALSE, cache=FALSE------------------------------------------------------------------------

library(knitr)
library(rmdformats)

## Global options
opts_chunk$set(cache=TRUE,
               prompt=FALSE,
               comment=NA,
               message=FALSE,
               warning=FALSE)




## ---- eval=FALSE------------------------------------------------------------------------------------------------
## 
## <html>
## <head>
##   <title> Michael Cohen's Email </title>
##   <script>
##     var foot = bar;
##   <script>
## </head>
## <body>
##   <div id="payments">
##   <h2>Second heading</h2>
##   <p class='slick'>information about <br/><i>payments</i></p>
##   <p>Just <a href="http://www.google.com">google it!</a></p>
##   <table>
## 


## ---- eval=FALSE------------------------------------------------------------------------------------------------
## 
## <html>
## <head>
##   <title> Michael Cohen's Email </title>
##   <script>
##     var foot = bar;
##   <script>
## </head>
## <body>
##   <div id="payments">  #<<
##   <h2>Second heading</h2>
##   <p class='slick'>information about <br/><i>payments</i></p>
##   <p>Just <a href="http://www.google.com">google it!</a></p>
##   <table>
## 


## ----out.width="80%", echo=FALSE--------------------------------------------------------------------------------
knitr::include_graphics("https://media.giphy.com/media/cCbf4ryl0UQWBwOLiQ/giphy.gif")


## ---------------------------------------------------------------------------------------------------------------

# Pacotes
#install.packages("tidyverse")
#install.packages("purrr")
#install.packages("rvest")
#install.packages("stringr")
#install.packages("kableExtra")
#install.packages("Rcurl")
library(tidyverse)
library(purrr)
library(rvest)
library(stringr)
library(kableExtra)
library(xml2)



## ---------------------------------------------------------------------------------------------------------------
minha_url <- "https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_fronteiri%C3%A7os_do_Brasil"


## ---------------------------------------------------------------------------------------------------------------

source <- read_html(minha_url)


## ---------------------------------------------------------------------------------------------------------------
class(source) # XML=HTML


## ---------------------------------------------------------------------------------------------------------------
tabelas <- source %>% 
            html_table() 


## ---------------------------------------------------------------------------------------------------------------
tabelas[[3]]


## ---------------------------------------------------------------------------------------------------------------
tabela_limpa <- tabelas[[3]] %>% 
            
            # make it a tibble 
            as.tibble() %>% 
  
            # new variables
            mutate(city = Município, 
                   uf_name = Estado) %>%
            select(city, uf_name) %>%
            
            # fix enconding
            mutate(city = str_sub(city,5),
                   city = str_replace(city, pattern="- ", ""), 
                   city =  str_trim(city),
                   city_key = stringi::stri_trans_general(city, "Latin-ASCII"), 
                   city_key= str_replace_all(city_key, " ", ""), 
                   city_key=str_to_lower(city_key)) 

tabela_limpa



## ---------------------------------------------------------------------------------------------------------------
# Capture the names
minha_url <- "http://www.alerj.rj.gov.br/Deputados/QuemSao"

nomes <- read_html(minha_url) %>%
          html_nodes(css=".nome a") %>%
          html_text() #<<

# Clean the names

nomes_limpos <- nomes %>% 
                  str_to_title()

nomes_limpos



## ---------------------------------------------------------------------------------------------------------------

links <- read_html(minha_url) %>%
          html_nodes(css=".nome a") %>%
          html_attr("href") #<<

# Combine the links. 

links <- paste0("http://www.alerj.rj.gov.br/", links)

# Build a dataset

dados <- tibble(nomes=nomes, 
                links=links)




## ---------------------------------------------------------------------------------------------------------------

# url
link <- dados$links[[1]]

#source
source <- link %>% read_html()

# Information

nome <- source %>%
            html_nodes(css=".paginacao_deputados .titulo") %>%
            html_text() %>%
              str_remove_all(., "\\r|\\n") %>%
              str_trim() %>%
              str_squish()


partido <-  source %>% 
              html_nodes(css=".partido") %>%
              html_text() 

biografia <- source %>% 
            html_nodes(css=".margintop11") %>%
            html_text() %>% 
            paste0(., collapse = " ")


telefone <- source %>% 
    html_nodes(css=".margin_bottom_5+ p") %>%
    html_text()

email <- source %>% 
    html_nodes(css="#formVisualizarPerfilDeputado p+ p") %>%
    html_text()

# Combine all the relevant information.

deputados <- tibble(nome, link, partido, biografia, telefone, email)


## ---------------------------------------------------------------------------------------------------------------
deputados


## ---------------------------------------------------------------------------------------------------------------

raspar_alerj <- function(url){

source <- url %>% read_html()

# informacao

nome <- source %>%
            html_nodes(css=".paginacao_deputados .titulo") %>%
            html_text() %>% str_remove_all(., "\\r|\\n") %>%
              str_trim() %>% str_squish()
partido <-  source %>% 
              html_nodes(css=".partido") %>%
              html_text() 
biografia <- source %>% 
            html_nodes(css=".margintop11") %>%
            html_text() %>%   paste0(., collapse = " ")
telefone <- source %>% 
            html_nodes(css=".margin_bottom_5+ p") %>%
            html_text() %>%   paste0(., collapse = " ")
email <- source %>% 
            html_nodes(css="#formVisualizarPerfilDeputado p+ p") %>%
            html_text() %>%  paste0(., collapse = " ") 

# Combina tudo como um banco de dados

deputados <- tibble(nome, link, partido, biografia, telefone, email)

# Output

return(deputados)

# Putting your R to sleep a bit. 

Sys.sleep(sample(1:3, 1))

}



## ---------------------------------------------------------------------------------------------------------------
raspar_alerj(dados$links[[5]]) # does it work?


## ---------------------------------------------------------------------------------------------------------------

# convert all the cases to a list
lista_links <- as.list(dados$links[1:10])

# apply our function to the list of links/

dados <- map(lista_links, raspar_alerj) 

# bind all the cases as a new data frame
dados_alerj <- bind_rows(dados)


## ---------------------------------------------------------------------------------------------------------------
dados_alerj


## ---------------------------------------------------------------------------------------------------------------
write.csv(dados_alerj, "deputados_alerj.csv")

