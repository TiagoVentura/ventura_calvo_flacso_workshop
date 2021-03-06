Intro
=====

This tutorial will introduce you to the main softwares we will be using
throughout our workshop. You need to run this tutorial to have
everything in place to fully participated in our classes.

R
=

We will use **R** as the software and programming language in this
course. R is a free programming language, extremely flexible and with an
excellent support community. It is now one of the most used software by
social scientists and data scientists in general. For this reason, I
chose to use R.

A super frequently asked question when I teach other iterations of this
workshop is: **Why R?**. The answer for me is simple: R is unbeatable
when it comes to manipulating databases (the rectangular Excel-style
datasets we love), data visualization and statistical modeling. In
addition, R is also a programming language, which allows you to do
everything that other more general languages do, together with the
excelent features with regards to data manipulation, visualization, and
modeling tools mentioned above.

Below you can see how to install R on your local machine.

### Windows

To install R on Windows, the first step is to download the program. To
do this, enter [this link](https://cran.r-project.org/bin/windows/base/)
and click on “Download R 4.03 for Windows”.

You will download it, and the file will probably be saved in your
Downloads folder. Go to this folder, double click on the file and start
installing **R**.

### Mac OS

To install R on Mac OS, the first step is to download the program. To do
this, enter [this link](https://cran.r-project.org/bin/macosx/) and
click on “Download R 4.03”.

Rstudio
=======

**R** is a programming language that, after you install it, you can
access on your computer on many different ways. You can call **R** from
your command line, as old-school programmers usually do. Or you can use
other softwar and programs developed to make the usage of the language
more intuitive. These softwares are called IDEs – integrated development
environment.

The most famous and useful IDE for R is called **RStudio**. Without
goint O IDE mais utilizado em R chama-se **RStudio**. Without delving
into computer science concepts too much, R Studio consists of a program
that integrates R with other tools, and makes using R more intuitive.
For example, R Studio is already integrated with other programs (like
git), allows multiple tasks to be done with point-and-click, allows
**auto-completion** of programming functions and indicates when there
are errors in your code.

To download RStudio, you can click
[here](https://rstudio.com/products/rstudio/download/). You should
choose the version corresponding to your operating system.

Once installed, to use R, you can go directly to R Studio, and open it.
Then we’re ready to start programming.

R Studio Tutorial
-----------------

Tools –\> Global Options
------------------------

Before we begin, let’s set a few RStudio settings to improve your
experience.

1.  Click “Tools –\> Global Options –\> Appearance” to change your color
    and font settings.

2.  Click “Tools –\> Global Options –\> Code” and check the box that
    says “Soft-wrap R source files” to wrap the text in your script to
    the width of the script pane.

3.  Click “Tools –\> Global Options –\> Code –\> Display” and check the
    boxes that say “Highlight selected line” and “Highlight R function
    calls”.

The basics: Navigating RStudio
==============================

Open RStudio! Then, open a new script by clicking “File –\> New File –\>
R Script” or by pressing `Ctrl + Shift + N` (PC) or
`command + shift + N` (Mac). After opening a new script, you should see
four window “panes”.

Top left pane (input/script)
----------------------------

Enter code in this savable `script` file in the top left pane. This is a
plain text file but with a .R extension. Enter `2 + 2` in your script
and run a line of code by pressing `command + enter` (Mac) or
`Ctrl + enter` (PC). Or, click the “Run” button at the top of the
script.

A hashtag `#` tells R that you do not want that particular line or block
of code to be run - this is called **commenting your code**. This is
handy for making notes to yourself and you can even add hashtags after
lines of runable code, on the same line.

The name of your script file is in the tab at the top of your script
window - the name defaults to `Untitled1`. Be sure to save your script
by clicking “File –\> Save” or `command + s` (Mac) or `Ctrl + s` (PC).
You can also click the floppy disk icon to save.

Bottom left pane (output/console)
---------------------------------

Code output is displayed in the `console` in the bottom left pane. This
space is also good for just noodling around and trying out code that you
do not wish to save in your script.

In the console, the prompt `>` looks like a greater than symbol. If your
prompt begins to look like a `+` symbol by mistake, simply click in your
console and press the `esc` key on your keyboard as many times as
necessary to return to the prompt.

R uses `+` when code is broken up across multiple lines and R is still
expecting more code. A line of code does not usually end until R finds
an appropriate stop parameter or punctuation that completes some code
such as a closed round parenthesis `)`, square bracket `]`, curly brace
`}`, or quotation mark `'`.

If the output in your console gets too messy, you can clear it by
pressing `control + l` on both Mac and PC. This will not erase any saved
data - it will simply make your console easier to read.

Top right pane (global environment)
-----------------------------------

Data are saved in R’s memory as “variables”. Variables are simply
placeholders for a value, mathematical expression, word, function, or
dataset! The global “Environment” tab in the upper right pane displays
the variables you have assigned/saved. “Global” simply means that these
variables are available for any task.

Bottom right pane (files, plots, packages, and help)
----------------------------------------------------

Here you find useful tabs for navigating your file system, displaying
plots, installing packages, and viewing help pages. Press the `control`
key and a number (1 through 9) on your keyboard to shortcut between
these panes and tabs.

### <span style="color:#e13d3d"> EXTRA: Instalando pacotes no R </span>

There are a number of `packages` that are supplied with the R
distribution. These are known as \`\`[base
packages](https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html)"
and they are in the background the second one starts a session in R.

Packages are collections of R functions, data, and compiled code in a
well-defined format. To use a package you need to go through the
following steps:

1.  Install the package – **only once**.
2.  Activate the package – **every time you open a new R session**.

On several occasions you will see conflicts appearing between packages,
or errors from packages with other dependencies in your machine. That’s
why I added this extra section where you can install some very useful
packages in your R. These are the main packages we will use in this
workshop.

Copy and paste these lines below and run (command + enter`(Mac) or`Ctrl
+ enter\` (PC)) each line to install the packages.

``` r
# Instalando um pacote. 
```

``` r
# Instalando um pacote.
install.packages("tidyverse") # conjunto de pacotes para manipulação e visualizaco
install.packages("quanteda") # análise de texto
install.packages("tidytext") # análise de texto
install,packages("rebus") # análise de texto
install.packages("ggthemes") # Visualização
install.packages("ggrepel") # Visualizacao
install.packages("here") # código reproduzível
install.packages("stm") # modelo de topics
install.packages("tidystm") # modelo de topicos
install.packages("RColorBrewer") # Cores bonitas
install.packages("tidymodels") # modelagem
install.packages("estimatr") # modelagem
install.packages("rjson") #manipular json
install.packages("rtweet") # twitter
install.packages("rvest") #scrapping
install.packages("httr") #scrapping
install.packages("xml2") # scrapping
install.packages("electionsBR") # dados eleitorais no Brasil
```

### <span style="color:#e13d3d"> EXTRA II: Any error? </span>

Do not worry! Errors in installing packages are very common. And among
the most useful elements of using R is the large number of resources
available online and an excellent community of programmers willing to
help you going through these problems.

First, if you have problems installing packages, make sure you are
connected to the internet and that
<a href="https://cloud.r-project.org/" class="uri">https://cloud.r-project.org/</a>
is not blocked by your firewall or proxy.

Second, look for help on google. I’ve been programming in R for almost
ten years, and I cannot programm without asking for help on google.
Asking for help online is simple: copy and paste R’s message into
google. And go get the solutions. The main solutions site is called
**stackoverlflow**. Most of the solutions there will solve your
problems.

RMarkdown
---------

Several of the materials I will use in the course were generated using
**Rmarkdown**. The **R Markdown** is a packages that allows you to
combine text (markdown) with code (R) and generate high quality
documents in html, doc and pdf. You can read more
[here](https://bookdown.org/yihui/rmarkdown/)

This combination between text and code sounds simple, but it is not. It
is a complex and extremely useful capability. For example, this
tutorial, as well as my slides, were all done using Rmarkdown. We will
explore together the potential of Rmarkdown in the next classes. For
now, let’s just install the package.

Open an R script on your laptop and run the following code.

``` r
# Install from CRAN
install.packages('rmarkdown')
```

### Rmarkdown to pdfs.

To produce documents using Rmarkdown in PDF format, we need to have
LaTeX installed in our operating system. Latex is a text markup language
– a syntax in which you write text with layout indications, as it should
appear on the final page. In other words, you don’t immediately see the
output of your writing. Instead of using word point-and-click, LaTeX
uses a series of functions to produce its layouts, which, consequently,
makes it more flexible, and very useful for academic text production.

For R Markdown users who are not LaTeX users, it is suggested that you
install TinyTeX
(<a href="https://yihui.name/tinytex/" class="uri">https://yihui.name/tinytex/</a>).

``` r
install.packages('tinytex')
tinytex::install_tinytex()  # install TinyTeX
```

Google Chrome
-------------

You will need to have a modern web browser installed to perform some of
the tasks in this lesson. The recommended browser for this class is
[Google Chrome](https://www.google.co.uk/intl/en_uk/chrome/).

Gadget Selector.
----------------

As part of the data scraping classes, you will need to examine the HTML
elements in your data. In this lesson, we’ll use the Selector Gadget for
this purpose. This tool allows us to easily examine the elements behind
each webpage.

If you are using Google Chrome, you can simply install the [Selector
Gadget extension in
Chrome](https://chrome.google.com/webstore/detail/selectorgadget/mhjhnkcfbdhnjickkkdbjoemdmbfginb?hl=en).
If for some reason you can’t use Chrome extensions (including in Chrome
itself), you can install Selector Gadget by following the instructions
on the Selector Gadget website.

### APIs

We will have a full day of the workshop dedicated to learning how to
access APIs. In plain English, APIs are online addresses created by
someone that wishes to to make it easy to send and share data.

Some APIs require no authentication. However, others, for security
reasons, require a registration (token and username) for access to the
APIs to be released. The following sections show you a step by step for
you to get your passwords on two APIS that I will use throughout the
course.

Twitter API
===========

The twitter API is definitily the one most heavily used by researhcers.
First, let’s register on Twitter. For this you need to have a normal
twitter account. Then you should go to the developer website
<a href="https://developer.twitter.com/" class="uri">https://developer.twitter.com/</a>
to create a special account. On this site, you click on the top corner
where it says dashboard app

<br>

![](twitter1.jpeg)

Then you click again to apply. And select the student option, as shown
below.

<br> ![](twitter2.jpeg)

From this point on, twitter will ask you for information such as your
phone number, address, and why you want the developer account. Be
honest, what we’re doing is allowed by the twitter rules. Write that you
are taking a course on data science and will use twitter with
educational purposes. Every time twitter asks you to refer a website,
put the address of our github page.

One catch. Twitter accepts requests in English only. Don’t waste time
trying to write very elaborate English. Be objective, and use google
translator if you need help. After that, your order will go for review,
and it may be authorized immediately, or twitter will ask you for more
information. You should start this request as soon as possible.

Once your developer account is approved, you can log in again and click
the “Create a new app” button in the upper right corner of the screen.
Our goal is not to create a full-featured app at this point, but simply
to get the necessary credentials to start making some simple calls to
the Twitter API. If all goes well, you will see the following image.
Those are your credentials. don’t share with anyone. During the course,
we will learn together how to use them.

![](credentials_blurred.png)

Crossfire API
=============

The Crossfire is a data laboratory, a collaborative digital platform
that records the incidence of armed violence in the metropolitan regions
of Rio de Janeiro and Recife. Instead of answering emails providing the
data, they created an API to allow access to the data collected in the
project. We are going to use their API, so we need to request a
registration.

Here you register and request the api password
<a href="https://api.fogocruzado.org.br/register" class="uri">https://api.fogocruzado.org.br/register</a>.
It’s as simple as creating an email. After registering, you will receive
an email, and you will be able to login to the site. Once authenticated,
this code below will return your api password.

``` r
# api fogo cruzado
library(httr)
library(jsonlite)
library(tidyverse)
```

    ## ── Attaching packages ────────────────────────────────── tidyverse 1.3.0.9000 ──

    ## ✓ ggplot2 3.3.3     ✓ purrr   0.3.4
    ## ✓ tibble  3.1.0     ✓ dplyr   1.0.5
    ## ✓ tidyr   1.1.3     ✓ stringr 1.4.0
    ## ✓ readr   1.4.0     ✓ forcats 0.5.0

    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## x dplyr::filter()  masks stats::filter()
    ## x purrr::flatten() masks jsonlite::flatten()
    ## x dplyr::lag()     masks stats::lag()

``` r
# Getting you access token.

get_jwt <- httr::POST("https://api.fogocruzado.org.br/api/v1/auth/login",
                 query = list(email = "your_email", password = "yourpassword"))

token <- httr::content(get_jwt)$access_token


# token = your password for the API
```

\`\`\`

Conclusion.
-----------

For today, we’re done.

See you!!!
----------
