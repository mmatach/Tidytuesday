#Week 17 - Anime data set
#Ikuhara Kunihiko's TV series against all other series, grouped by year

library(tidyverse)
library(gghighlight)
library(extrafont)
tidy_anime <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-04-23/tidy_anime.csv")

above1990 <- dplyr::filter(tidy_anime, type=="TV" & start_date>"1990-01-01")
only_rel<-distinct(only_rel, .keep_all = FALSE)
only_rel<-select(only_rel, title_english, score, start_date)
only_rel_sep<-separate(only_rel, start_date,
                       into = c("year", "rest"))
only_rel_sep<-select(only_rel_sep, title_english, score, year)

p<-ggplot(only_rel_sep, aes(x=year, y=score))+
  geom_point(colour="black")+
  gghighlight(title_english=="Sailor Moon R" | title_english=="Sailor Moon S"
              | title_english=="Sailor Moon SuperS"| title_english=="Penguindrum"
              | title_english=="Revolutionary Girl Utena"| title_english=="Yurikuma Arashi"
              | title_english=="Sarazanmai", 
              label_key=title_english,
              label_params=list(size=3, label.r=0.3), 
              use_group_by = FALSE,
              unhighlighted_colour=alpha("#aa82a7", 0.8))+
  geom_point(colour="black", size=2)

 p+scale_y_continuous(breaks=c(0,1,2,3,4,5,6,7,8,9,10))+
   ggtitle("Ikuhara Kunihiko's TV series in the eyes of MAL users")+
   theme(text=element_text(family="Corbel"),
     plot.title=element_text(size=20, colour="#bb6699", face="bold"),
     axis.title.x=element_text(size=12, colour="#bb6699"), 
     axis.title.y=element_text(size=12, colour="#bb6699"),
     axis.ticks.x=element_line(colour="transparent"),
     axis.ticks.y=element_line(colour="transparent"),
     axis.text.x=element_text(size=9, colour="darkgrey"),
     axis.text.y=element_text(size=9, colour="darkgrey"),
     panel.background=element_rect(fill="#eeddee"))
