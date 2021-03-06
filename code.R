#******************************************************************************#
#                                                                              #
#                    Lab 3 - Data Acquisition & Analysis                       #
#                                                                              #
#                     Your Name - Data Driven Securty                          #
#                                                                              #
#******************************************************************************#

## Crawling y Scrapping


### 1.1 Obtención de la página web

library(httr)
library(xml2)
library(stringr)
library(ggplot2)


link <- GET("https://www.mediawiki.org/wiki/MediaWiki")

### 1.2 Analisis de el contenido de la web

### 1.3.	Extracción de enlaces
extraer_links <- function(link){
  
  page <- content(link, "text", encoding = "ISO-8859-1")
  parse <- read_html(page)
  links <- xml_find_all(parse, "//@href") 
  links <- xml_text(links)
  df <- data.frame(url=character(), status=integer(), stringsAsFactors = FALSE)
  de <- list()
}

### 1.4 Exploración de enlaces

exploracion_datos <- function(links){
  for(item in links){
    de <- list()
    https_t <- str_detect(item, "http")
    if(https_t == TRUE){
      status = HEAD(item)
      status = status_code(status)
      print(status)
      #item <- as.factor(item)
      print(item)
      de <- c(de, item)
      de <- c(de, status=status)
      df[nrow(df) + 1,] = de
    }
  }
}

### Gráficos en R

### 2.1 Histograma


hist(df$status)


### 2.2 Un gráfico de barras

bar_plot(df)

### 2.3 Pie Chart

pie_chart(df$url)
