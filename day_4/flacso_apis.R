
## ---------------------------------------------------------------------------------------------------------------
library(httr)
library(tidyverse)
# Acess the API
endpoint = "https://dog.ceo/api/breeds/image/random"

acesso = GET(endpoint)

# examine the objects
class(acesso) 



## ---------------------------------------------------------------------------------------------------------------
# see the element
content(acesso)

# Access the content.

link_image <- content(acesso)$message
download.file(link_image, 
              destfile = "cao.png")



## ----echo=FALSE-------------------------------------------------------------------------------------------------

# Activating the packages
library(httr) 
library(jsonlite)
library(tidyverse)

## ----eval=FALSE-------------------------------------------------------------------------------------------------
## 
## # Activating the packages
## library(httr)
## library(jsonlite)
## library(tidyverse)
## 
## # asking for the password
## 
get_jwt <- httr::POST("https://api.fogocruzado.org.br/api/v1/auth/login",
                 query = list(email = "venturat@umd.edu", password = "xxxxxxxxxx"))


# get the token
token <- httr::content(get_jwt)$access_token


## ---------------------------------------------------------------------------------------------------------------
# Step 1: Create the URL
base_url <- "https://api.fogocruzado.org.br/api/v1"
cities <- "/cities"
api <- paste0(base_url, cities)
print(api) # somente um site


## ---------------------------------------------------------------------------------------------------------------

#  Step 2: Acces the api

response <- GET(api,  
                add_headers('Authorization' = paste("Bearer", token, sep = " ")))

# Result
response


## ---------------------------------------------------------------------------------------------------------------
# Convert to a json
json_fogo_cruzado <- content(response, as="text", encoding = "UTF-8")


## ---------------------------------------------------------------------------------------------------------------
# Cleaning Jsons
output <- fromJSON(json_fogo_cruzado) %>%
              tibble::as_tibble()
output


## ---------------------------------------------------------------------------------------------------------------
# shootings
base_url <- "https://api.fogocruzado.org.br/api/v1"
occurences <- "/occurrences"
api <- paste0(base_url, occurences)
print(api)

# Build a Query
query_list <- list(data_ocorrencia="2019-01-01", 
                   nome_cidade= "Rio de Janeiro")
# GET
response <- GET(api,
                query=query_list,
              add_headers('Authorization' = paste("Bearer", token, sep = " ")))

output <- jsonlite::fromJSON(httr::content(response, as="text", encoding = "UTF-8")) %>%
    tibble::as_tibble()

View(output)



## ---------------------------------------------------------------------------------------------------------------
# url basica de ocorrencias.
base_url <- "https://api.fogocruzado.org.br/api/v1"
occurences <- "/occurrences"
filter= "?data_ocorrencia[gt]=2019-01-01&data_ocorrencia[lt]=2019-05-01&CidadeID[]=3661"
api <- paste0(base_url, occurences, filter)
print(api)

# GET
response <- GET(api,
              add_headers('Authorization' = paste("Bearer", token, sep = " ")))

output <- jsonlite::fromJSON(httr::content(response, as="text", encoding = "UTF-8")) %>%
    tibble::as_tibble()

output



## ----eval=FALSE-------------------------------------------------------------------------------------------------
## 
#Instalation
install.packages("devtools") # pacote para acessar o github
devtools::install_github("voltdatalab/crossfire")


## ----eval=FALSE-------------------------------------------------------------------------------------------------
## library(crossfire)
## 
# Tell you user

fogocruzado_signin(email = "venturat@umd.edu", password = "xxxxxx")

# Extract the data (same thing we did before)

fogocruzado_rj <- get_fogocruzado(state= "RJ", security_agent = 1)


## ----echo=FALSE-------------------------------------------------------------------------------------------------
library(crossfire)

# Registra usuario e senha, e envia sua senha da API

crossfire::fogocruzado_signin(email = "venturat@umd.edu", password = "ptds42420678")

# Extrair os dados que pegamos manualmente antes


df <- get_fogocruzado(city = c("Rio de Janeiro", "Recife"),
                                         initial_date = "2018-07-01", final_date = "2018-12-31")

glimpse(df)

