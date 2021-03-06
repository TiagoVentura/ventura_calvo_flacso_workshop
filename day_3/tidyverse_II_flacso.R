## ----------------------------------------------------------------------------------------------------------------
library(gapminder)
gapminder 

## ----------------------------------------------------------------------------------------------------------------
wide <- tibble(pais=c("Brasil", "Uruguai", "Chile"), 
               pres_ano_2010= c("Lula", "Mujica", "Pinera"), 
               pres_ano_2014=c("Dilma", "Tabare", "Bachelet"), 
               pres_ano_2018=c("Temer", "Lacalle", "Pinera"))
wide


## ----------------------------------------------------------------------------------------------------------------
tab <- tibble(pais=c("Brasil", "Uruguai", "Argentina"),
       i_2010 = c(5, 1, 2), 
       i_2014 = c(10, 9, 9),
       i_2018 = c(0, 1, 2))
tab 


## ----------------------------------------------------------------------------------------------------------------
tab1 <- tibble(pais=c("Brasil", "Argentina"),
       ano = c(2020, 2020),
       presidente_vice = c("Bolsonaro-Mourão", "Fernandez-Kirchner"))

tab1 


## ----------------------------------------------------------------------------------------------------------------
tab2 <- tibble(pais=c("Brasil", "Brasil",  "Argentina", "Argentina"),
       ano = c(2020, 2020, 2020, 2020), 
       covid = c("Casos", "Vacinas", "Casos", "Vacinas"), 
       numero= c(10500000, 6535363, 2100000, 1800000))
tab2


## ----------------------------------------------------------------------------------------------------------------

# Before = Wide 
wide

# Pivoting

wide %>%
  pivot_longer(cols=c(pres_ano_2010, pres_ano_2014, 
                      pres_ano_2018), 
               names_to="presidente_ano", 
               values_to="presidente")



## ----------------------------------------------------------------------------------------------------------------

tab %>%
  pivot_longer(cols = c(starts_with("i")), 
               names_to="t", 
               values_to="values")



## ----out.width="80%", echo=FALSE---------------------------------------------------------------------------------
knitr::include_graphics("./figs/spread.png")


## ----------------------------------------------------------------------------------------------------------------
tab2

# untidying
tab2 %>%
  pivot_wider(names_from=covid, 
              values_from=numero)


## ----------------------------------------------------------------------------------------------------------------

tab2 <- tab2 %>%
        add_row(pais="Uruguai", 
                ano=2020, 
                covid="Casos", 
                numero=8919)


## ----------------------------------------------------------------------------------------------------------------
# tidying with Missings
tab2 %>%
  pivot_wider(names_from=covid, 
              values_from=numero)



## ----------------------------------------------------------------------------------------------------------------

# tidying Com Missings
tab2 %>%
  pivot_wider(names_from=covid, 
              values_from=numero, 
              values_fill=0) #<<



## ----------------------------------------------------------------------------------------------------------------
tab1 %>%
  separate(presidente_vice, into=c("presidente", "vice"), 
                            sep="-")


## ----------------------------------------------------------------------------------------------------------------
str_detect(c("Tiago", "Ventura"), "Ventura")


## ----------------------------------------------------------------------------------------------------------------
str_count(c("Tiago", "Ventura"), "Ventura")


## ----------------------------------------------------------------------------------------------------------------
str_locate(c("Tiago#umd", "Ventura#fgv"), "#")


## ----------------------------------------------------------------------------------------------------------------
str_replace_all(c("Tiago#umd", "Ventura#fgv"), "#", " ")


## ----------------------------------------------------------------------------------------------------------------
str_to_lower(c("Tiago#umd", "Ventura#fgv"))


## ----------------------------------------------------------------------------------------------------------------
cand <- get_candidates(year=2018,
                       position="Federal Deputy") %>%
          as_tibble()



## ----------------------------------------------------------------------------------------------------------------
library(cepespR)
cand %>%
  select(NOME_URNA_CANDIDATO) %>%
  mutate(nome_minusculo=str_to_lower(NOME_URNA_CANDIDATO))


## ----------------------------------------------------------------------------------------------------------------
# Lets transform this collumn to a vector just os show a few more easy examples

nomes<-cand$NOME_URNA_CANDIDATO[1:10]


## ----------------------------------------------------------------------------------------------------------------
str_sub(nomes, 1, 5)


## ----------------------------------------------------------------------------------------------------------------
str_subset(nomes, "PASTOR")


## ----------------------------------------------------------------------------------------------------------------
str_extract_all(nomes, "PASTOR|CHICO") # | = or


## ----------------------------------------------------------------------------------------------------------------
tweets <- c("RT: Hello! Hello", "Hello World!")

# starts with
str_subset(tweets, "^RT")

# Has !
str_subset(tweets, "!")

# ends with !
str_subset(tweets, "!$")



## ----------------------------------------------------------------------------------------------------------------
# start with R and any character.
str_subset(tweets, "^R.")

# Any digit
str_subset(tweets, "\\d")

# has one or the other
str_detect(c("bolsonaro", "Bolsonaros"), "[b|B]olsonaro")

