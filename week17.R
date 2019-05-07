#Week 17 - Anime data set
#Ikuhara Kunihiko TV series against all other series grouped by year

library(tidyverse)
library(gghighlight)
tidy_anime <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-23/tidy_anime.csv")

above1990 <- dplyr::filter(tidy_anime, type=="TV" & start_date>"1990-01-01")
only_rel<-select(above1990, title_english, score, premiered)
only_rel<-distinct(only_rel, .keep_all = FALSE)
only_rel_sep<-separate(only_rel, premiered,
                       into = c("season", "year"))
only_rel_sep<-select(only_rel_sep, title_english, score, year)

ggplot(only_rel_sep, aes(x=year, y=score))+
  geom_point()+
  gghighlight(title_english=="Sailor Moon R" | title_english=="Sailor Moon S"
              | title_english=="Sailor Moon SuperS"| title_english=="Penguindrum"
              | title_english=="Revolutionary Girl Utena"| title_english=="Yurikuma Arashi"
              | title_english=="Sarazanmai", label_key=title_english)


#wywalic year=NA
#kolor
