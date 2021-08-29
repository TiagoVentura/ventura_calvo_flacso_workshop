# Data Processing and Text Analysis / Scrappin and Big data

This course is aimed at professionals and students of Social Sciences, interested in the use of quantitative methods for the analysis of big data, with emphasis on the analysis of unstructured data and social networks. The objective is to provide a systematic exposition of the fundamental concepts for those who want to participate in the increasingly close link between Data Analysis and the Social Sciences.

The seminar is structured in 10 lectures of 3 hours. The lectures will be complemented by a laboratory/practical session during the afternoon. It will be held in R/R-Studio.

Online classes according to Mexico city time

Date: August 30th to September 10th, 2021 

Schedule: 9:00 to 12:00

Lab Sessions: 13:00 to 15:00

Language: Taught in English

## Instructor Week 1: Tiago Ventura

I am a Researcher at the @Twitter Civic Integrity and Misinformation Team and Ph.D. Candidate (expected October 2021) in the Department of Government and Politics at the University of Maryland, College Park. My research lies in the fields of Comparative Political Behavior and Political Communication. My dissertation explores issues of criminal violence, inequality, and preferences for harsh-on-crime policies in Latin America, while my agenda in political communication focuses on digital field and survey experimentation, news sharing, behavioral effects of social media consumption, and empirical applications of text-as-data models.

Throughout my Ph.D., I have been an leading member of the Interdisciplinary Laboratory for Computational Social Science (iLCSS) at UMD. While at the iLCSS, I have collaborated on a variety of projects, with several already published at top-ranked journals. My research has been published at Electoral Studies, Digital Journalism, Journal of Elections Public Opinion and Parties, Latin American Politics and Society, The Journal of Quantitative Description (Digital Media), and The SAGE Handbook of Research Methods in Political Science and International Relations . And my projects have been funded through grants and fellowships from the University of Maryland, Russel Sage Foundation, EGAP, the Inter-American Development Bank, CAPES (Brazilian Government).

I am also passionate about teaching and sharing my experience working on computational social science with other colleagues. I have taught several workshops at both graduate and undergraduate levels, including a full semester seminar on Introduction to Computational Social Science to undegraduate students. I was also the organizer of the first Summer Institute in Computational Social Science in Brazil during the Summer 2021.

You can contact me through my email (ventura@umd.edu). And you can know more about my research at my [website](https://tiagoventura.rbind.io/)

## Plans for week one. 

During week one, we cover several topics I would put under a *Crash Course do Data Science* kind of umbrella. We will start with a broader introduction to computational social science. Then we will go through a introduction basics of R, data manipulation, funcional programming, and the concept of tidy data. After that, we will see what I consider one of the key skills a data scientist should have: how to access, download, and work with digital data. We will cover both scrapping and APIs. To conclude, I will give you a intro do text-analysis in R. 

The structure of the course is simple. The morning will be focused on lectures and coding example. We will embed some coding exercises during our morning lectures, however, most of the time we will focus on me going through some code and presentation with you. For the afternoons, you will have some practice questions, as well as the opportunity to work through the code we discussed during the morning lectures. 

Our syllabus is available [here](https://www.dropbox.com/s/rohvst9at5bob3s/Calvo-Ventura-Flacso-Seminario%20Textos%20y%20Redes.docx?dl=0). The presentation and code for each section goes below. 

### Pre-Arrival.

I prepared a tutorial where you can find some help on how to install the softwares we will be using in this workshop. Please, run through this tutorial before the first day of class. 

The tutorial is [here](https://github.com/TiagoVentura/ventura_calvo_flacso_workshop/blob/main/install_fest.md)

### Day I

- Introduction to Computational Social Science ([Presentation](https://tiagoventura.github.io/ventura_calvo_flacso_workshop/day_1/intro_css_flacso))

- Intro to R ([Presentation](https://tiagoventura.github.io/ventura_calvo_flacso_workshop/day_1/intro_css_flacso/intro_r_flacso.Rmd), [Code](https://www.dropbox.com/s/it26ghjsr0nkbh7/intro_r_flacso.R?dl=0))

**Exercises and Readings for the Lab**


- Chapter 5 of [Hands-On Programming with R](https://rstudio-education.github.io/hopr/r-objects.html)
-  Carpentry Classes on [Data Types and Structures](https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/index.html), [Data Subsetting](https://swcarpentry.github.io/r-novice-gapminder/06-data-subsetting/index.html),  [Read and Write `.csv` files](http://swcarpentry.github.io/r-novice-inflammation/11-supp-read-write-csv/index.html)


### Day II: Tidyverse and Data Wrangling

- Introduction to Tidyverse([Presentation](), [Code]())

**Exercises and Readings for the Lab**

R for Data Science

- [Ch. 5: Data Transformation](https://r4ds.had.co.nz/transform.html) - `r4ds`
- [Ch. 13: Relational Data](https://r4ds.had.co.nz/relational-data.html) - `r4ds`
- [Ch. 18: Pipes](https://r4ds.had.co.nz/pipes.html) - `r4ds`
- [Ch. 10: Tibbles](https://r4ds.had.co.nz/tibbles.html) - `r4ds`


### Day III: Tidyverse II + Functional Programming + Loops

- TTidyverse II: Tidy Data + Strings in R ([Presentation](), [Code]())

- Functional Programming + Loops ([Presentation](), [Code]())

**Exercises and Readings for the Lab**

R for Data Science:

- [Ch. 12: Tidy Data](https://r4ds.had.co.nz/tidy-data.html)
- [Ch. 14: Strings](https://r4ds.had.co.nz/strings.html) 
- [Ch. 19: Functions](https://r4ds.had.co.nz/functions.html)
- [Ch. 21: Iteration](https://r4ds.had.co.nz/iteration.html)]

Rebeccas Barter Tutorial on [Purrr](https://www.rebeccabarter.com/blog/2019-01-23_scoped-verbs/) and [Scopped Verbs in R](https://www.rebeccabarter.com/blog/2019-08-19_purrr/)

### Day IV: Acessing Digital Data

- Webscrapping ([Presentation](), [Code]())

-  APIs ([Presentation](), [Code]())

**Exercises and Readings for the Lab**

Check out all the excelente materials by Chris Bail on text analysis in R. 

- [Digital Trace Data](https://cbail.github.io/textasdata/strengths-weaknesses/rmarkdown/Strengths_and_Weaknesses.html)
- [Screen Scrapping](https://cbail.github.io/textasdata/screenscraping/rmarkdown/Screenscraping_in_R.html)
- [APIs](https://cbail.github.io/textasdata/apis/rmarkdown/Application_Programming_interfaces.html)

### Day V: Intro do Text-Analysis (Tidy approach)

- Text analysis with tidy text ([Code]())

**Exercises and Readings for the Lab**

Text Minning with R

- [Ch. 1: The tidy text format](https://www.tidytextmining.com/tidytext.html) 
- [Ch. 2: Sentiment analysis with tidy data](https://www.tidytextmining.com/sentiment.html) 
- [Ch. 3: Analyzing word and document frequency: tf-idf](https://www.tidytextmining.com/tfidf.html)  
- [Ch. 5: Converting to and from non-tidy formats](https://www.tidytextmining.com/dtm.html) 
- [Ch. 6: Topic modeling](https://www.tidytextmining.com/topicmodeling.html) 


## Materials

All the materials are available in this repo. If you are familiar with git, you can just clone this repository locally, and get access to everything in just one place.

# Software 

This course will use [R](https://www.r-project.org/), which is a free and open-source programming language primarily used for statistics and data analysis. We will also use [RStudio](https://www.rstudio.com/), which is an easy-to-use interface to R. Make sure you install R and RStudio before the first day of class.
