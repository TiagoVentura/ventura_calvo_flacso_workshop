#################################################################
# Paper: Topic Models
# Author: Tiago Ventura
# Date: August 17
# Goal: Analyze Congressional Speeahes
#################################################################

# Basics ------------------------------------------------------------------
library(tidyverse)
library(electionsBR)
library(conflicted)
library(RColorBrewer)
library(here)
library(stringr)
library("quanteda")
library(tidytext)
library(rvest)
library(stm)
library(rebus)
library(ggrepel)
conflict_prefer("filter", "dplyr")
conflict_prefer("select", "dplyr")

# Clean the text ----------------------------------------------------------
# link for the data: https://www.dropbox.com/s/j4a4td9401ynmtn/speechs_df_id_correct.rdata?dl=0

#load(here("data", "speechs_df_id_correct.rdata"))

glimpse(sp_)
sp_ <- sp_ %>%
  filter(year_election==2014) %>%
  mutate(row_id=1:nrow(.))

# Pre-Processing.  -------------------------------------------------------
# We are going to use the quanteda package for modeling and pre-processing.
# The advantage of Quanteda is that many statistical packages use this format
# of storing text files for modeling. For example, the packages we will use
# for topic modeling use this file type.

# First step: create a corpus file
l_corpus <- corpus(sp_,
                   docid_field="id_new",
                   text_field = "speech")

# See this file
summary(l_corpus)
docnames(l_corpus)

# metadata
docvars(l_corpus)


# Cleaning the corpus -------------------------------------------------------


# Removing Words

# municipalities

municipalities <- read_html("https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_do_Brasil") %>%
  html_nodes("#mw-content-text li a") %>%
  html_text() %>%
  tibble(mun=.)

# States
tab_states <- read_html("https://mundoeducacao.bol.uol.com.br/geografia/estados-brasil.htm") %>%
  html_table() %>% .[[1]] %>%
  set_names(c("states", "code"))

states_names <- tab_states$states %>% str_to_lower()
states_codes <- tab_states$code %>% str_to_lower()
municipalities$mun <- municipalities$mun %>% str_to_lower()


# Functional Names
function_names <- c("candidat*", "brasil", "brasileir*", "câmara", "municipio",
                    "municipal", "eleições", "cidade", "partido",
                    "cidadão", "deputad*", "car*",
                    "plano", "suplementar", "é", "ser", "aqui", "faz",
                    "voto","votar", "eleitor*", "querid*",
                    "sim", "não", "dia", "hoje", "amanhã", "amig*",
                    "seção", "emenda", "i", "ii", "iii", "iv",
                    "colegas", "clausula", "prefeit*", "presidente",
                    "prefeitura", 'proposta','propostas','meta',
                    'metas','plano','governo','municipal','candidato',
                    'diretrizes','programa', "casa", "estado",
                    'eleição','coligação','município', "senhor", "sr", "dr",
                    "excelentissimo", "nobre", "deputad*", "srs", "sras", "v.exa",
                    "san", "arial", "sentido", "fim", "minuto", "razão", "v.exa",
                    "país", "brasil", "tribuna", "congresso", "san", "symbol", "sans", "serif",
                    "ordem", "revisão", "orador", "obrigado", "parte", "líder", "bloco", "esc",
                    "sra", "oradora", "bloco", "times", "new", "colgano", "pronuncia", "colega",
                    "presidenta", "pronunciamento", "mesa", "parlamentares", "secretário", "seguinte",
                    "discurso","mato", "sul", "norte", "nordeste", "sudeste", "centro-oeste", "sul", "grosso")

# Name of the Candidates

candidatos <- read_csv(here("data", "nomes_politicos.csv"))

# Create a DFM ------------------------------------------------------------

load(here("data", "corpus_speeches_clean.rdata"))
docvars(l_corpus_clean)$speech_id <- docnames(l_corpus_clean)
docvars(l_corpus_clean)$doc_id <- 1:nrow(docvars(l_corpus_clean))

sum(str_detect(docvars(l_corpus_clean)$nome.x, "PRESIDENTE")) # perfect

dfm_ <-dfm(l_corpus,
           verbose=TRUE,
           remove_punct=TRUE,
           remove_numbers=TRUE)

dfm_ <- dfm_ %>%
      dfm_remove(pattern=c(stopwords("portuguese"),
                              states_names,
                             states_codes,
                             function_names,
                             municipalities,
                             candidatos$nomes))

# Remove Small word
dfm_ <- dfm_ %>%
  dfm_remove(min_nchar = 5)


# Steamming e Trimming
dfm_red <- dfm_%>%
  dfm_wordstem(., language = "portuguese") %>%
  dfm_trim(.,
           min_docfreq = 0.01,
           max_docfreq = 0.95, docfreq_type = "prop")


topfeatures(dfm_, 100)
topfeatures(dfm_red, 100)
dim(dfm_red)

# Convert to the STM (topic model) format.

dfm_stm <-  quanteda::convert(dfm_red, to = "stm")

dfm_stm$documents[[1]]
# STM ---------------------------------------------------------------------

# STM is one out of many models to run topic analysis.
# Here if you are interested on reading more about this model.
#(https://scholar.harvard.edu/files/dtingley/files/topicmodelsopenendedexperiments.pdf)

# How Do Topic Models Work? --------------------------------------------

# Intuitively, topic templates work by finding clusters of words that occur in a way
# joint and most frequent in a given document corpus.

# Here for a reasonably intuitive introduction to Topic Templates (http://www.cs.columbia.edu/~blei/papers/Blei2012.pdf).
# Let's look at figure 1 of this article.



# Topic Templates from a practical point of view. ---------------------------

# input: Text + number of threads

# output 1: beta -> word vs topic association matrix.
# output 2: gamma -> document vs topic association matrix.

# Models ------------------------------------------------------------------


modelo <- stm(documents=dfm_stm$documents,
              vocab=dfm_stm$vocab,
              data = dfm_stm$meta,
              K = 60,
              init.type = "Spectral")

save(modelo, file = "modelo_topicos_aula.Rdata")

# Let's start with some functios form this packages.

# Then, we will move back to the tidy data format

# See the main topics
labelTopics(modelo)

# Finding Documents.
thoughts3 <- findThoughts(modelo, texts = dfm_stm$meta$rowid,
                            n = 2, topics = 3)$docs[[1]]

sp_ %>% filter(rowid %in% thoughts3) %>% pull(speech)

# Proportion of Topics
plot(modelo)

# Correlation Between Topics
mod.out.corr <- topicCorr(modelo)$cor

# Tidy -------------------------------------------------------------

# Topics and words
td_beta <- tidy(modelo)
td_gamma <- tidy(modelo, matrix = "gamma",
                 document_names = rownames(dfm_stm))
## Top Terms
top_terms <- td_beta %>%
  arrange(beta) %>%
  group_by(topic) %>%
  top_n(10, beta) %>%
  arrange(-beta) %>%
  select(topic, term) %>%
  summarise(terms = list(term)) %>%
  mutate(terms = map(terms, paste, collapse = ", ")) %>%
  unnest()

gamma_terms <- td_gamma %>%
  group_by(topic) %>%
  summarise(gamma = mean(gamma)) %>%
  arrange(desc(gamma)) %>%
  left_join(top_terms, by = "topic") %>%
  mutate(topic_ = paste0("Topic ", topic),
         topic_ = reorder(topic_, gamma))

summary(modelo)

# Looking for specific topics.
library(scales)
gamma_terms %>%
  filter(topic==3|topic==10| topic==12| topic==17| topic==54) %>%
  ggplot(aes(topic_, gamma, label = terms, fill = topic_)) +
  geom_col(show.legend = FALSE) +
  geom_text(hjust = 0, nudge_y = 0.0005, size = 6)+
  coord_flip() +
  scale_y_continuous(expand = c(0,0),
                     limits = c(0, .1),
                     labels = percent_format()) +
  theme_minimal(base_size = 12) +
  theme(plot.title = element_text(size = 22, face="bold"),
        plot.subtitle = element_text(size = 13),
        axis.title.x  = element_text(size=12, face="italic", hjust=1),
        axis.text.y =  element_text(size=12, face="bold"),
        axis.ticks = element_blank(),
        panel.grid = element_blank()) +
  labs(x = NULL, y = "Topic Proportions with most associated words")


# Main sppeches in each topic

speeches_topic <- td_gamma %>%
  group_by(document) %>%
  top_n(1) %>%
  arrange(document) %>%
  left_join(top_terms, by = "topic") %>%
  arrange(document, desc(gamma))

topics_top_speeches <- td_gamma %>%
  group_by(topic) %>%
  top_n(30) %>%
  arrange(document) %>%
  left_join(top_terms, by = "topic") %>%
  arrange(topic, desc(gamma))

# merge with complete text
meta <- topics_top_speeches %>%
            left_join(sp_, by=c("document"="row_id"))


## Exemplos: Topic
meta %>%
  filter(topic==3) %>%
  arrange(desc(gamma)) %>%
  select(topic, gamma, nome.x, speech) %>%
  slice(1:2) %>%
  pull(speech)


# Classification: Top Speech -----------------------------------------------
doc_sec <- td_gamma %>%
  group_by(document) %>%
  top_n(1) %>%
  ungroup() %>%
  left_join(top_terms, by = "topic") %>%
  arrange(document, desc(gamma)) %>%
  left_join(sp_, by=c("document"="row_id"))

# Validation --------------------------------------------------------------
library(lubridate)
time_series <- doc_sec %>%
  mutate(date=as.Date(horaInicioDiscurso.x, format='%d/%m/%Y'),
         year=year(date),
         month=month(date)) %>%
  filter(topic==3|topic==10| topic==12| topic==17| topic==54)


# Topico 37 + topic 9 in 2006
time_series_3_10 <- doc_sec %>%
  mutate(date=as.Date(horaInicioDiscurso.x, format='%d/%m/%Y'),
         year=year(date),
         month= month(date),
         w=week(date)) %>%
  filter(topic==3|topic==10) %>%
  count(year, month, date)
labelTopics(modelo)

ggplot(time_series_3_10 %>% filter(year==2015),
       aes(x=date, y=n)) +
  geom_segment(aes(x=date, xend=date, y=0, yend=n), alpha=.4) +
  geom_point(color="#CB2314", size=2) +
  scale_x_date(breaks = "month",
               labels = date_format("%b")) +
  labs(y="Number of Speeches per Day",
       x= "Months in 2006",
       title = "Topics 9 and 35") +
  annotate("text",
           label = " Pec Maioridade Penal",
           y=17, x=as.Date("2015-05-05"),
           size = 8,
           lineheight = 1.4,
           hjust = 0,
           nudge_x = 3.5,
           fill = NA,
           label.color = NA,
           fontface =2) +
  theme_minimal()

