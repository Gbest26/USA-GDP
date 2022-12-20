library(tidyverse)
library(dplyr)
library(janitor)
library(skimr)
library(lubridate)
library(tidyr)
library(ggplot2)
library(colorspace)
library(here)

library(readr)
GDP_by_County <- read_csv("C:/Users/pc/Desktop/my project raw file/usa county with the highest gdp/GDP_by_County.csv")
View(GDP_by_County)

USA_gpd <- GDP_by_County %>% 
  group_by(Year) %>%
  drop_na() %>% 
  summarise(total_gdp_yearly=sum(GDP_in_dollars))
view(USA_gpd)

write.table(USA_gpd, file = "usa_gdp.csv", row.names = F, sep = ",")

gpd_par_state <- GDP_by_County %>% 
  group_by(Year, State) %>%
  drop_na() %>% 
  summarise(total_gdp_yearly=sum(GDP_in_dollars))
view(gpd_par_state)
write.table(gpd_par_state, file = "gdp_par_state.csv", row.names = F, sep = ",")

gdp_by_county <- GDP_by_County %>% 
  group_by(Year,State,County) %>% 
  drop_na() %>% 
  summarise(county_gdp=sum(GDP_in_dollars))
view(gdp_by_county)

gdp_by_county2 <- gdp_by_county %>% 
  group_by(county_gdp,Year,State,County) %>% 
  drop_na() %>% 
  summarise(counties_with_highest_gdp=max(county_gdp)) %>% 
  tail(10)
View(gdp_by_county2)
write.table(gdp_by_county2, file = "counties_with_highest_gdp.csv", row.names = F, sep = ",")