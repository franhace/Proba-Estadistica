#Author: Ximena Fernandez

options(warn=-1)

#importamos tabla
corona <- read.csv("./novel-corona-virus-2019-dataset/covid_19_data.csv", 'stringsAsFactors'=FALSE)
head(corona)

#arreglamos algunas columnas y datos
corona$ObservationDate <- as.Date(corona$ObservationDate, format = "%m/%d/%y")
corona$'Country.Region'[corona$'Country.Region'  == 'Mainland China'] <- 'China'
corona$'Country.Region'[corona$'Country.Region'  == 'US'] <- 'United States of America'

head(corona)

library(dplyr)

corona %>% 
  group_by(ObservationDate) %>% 
  summarise(TotalConfirmed = sum(Confirmed)) -> confirmed

head(confirmed)

#plot(confirmed$ObservationDate, confirmed$TotalConfirmed) 

library(highcharter)

confirmed %>% 
  hchart("line", hcaes(x = ObservationDate, y = TotalConfirmed)) %>% 
  hc_title(text = "Trendline of COVID-19 Confirmed") 

corona %>% 
  group_by(ObservationDate) %>% 
  summarise(TotalRecovered = sum(Recovered)) -> recovered 

recovered %>%
  hchart("line",hcaes(x = ObservationDate, y = TotalRecovered)) %>% 
  hc_title(text = "Trendline of COVID-19 Recovered") 

corona %>% 
  group_by(ObservationDate) %>% 
  summarise(TotalDeaths = sum(Deaths)) -> deaths

deaths %>%
  hchart("line", hcaes(x = ObservationDate, y = TotalDeaths)) %>% 
  hc_title(text = "Trendline of COVID-19 Deaths")# %>% 
  #hc_add_theme(hc_theme_538())

#filtramos el último día
corona_latest <- corona %>% 
filter(ObservationDate %in% max(corona$ObservationDate))
head(corona_latest)

#sumamos confirmados, recuperados y fallecidos
confirmed <- sum(corona_latest$Confirmed) 
recovered <- sum(corona_latest$Recovered) 
deaths <- sum(corona_latest$Deaths)

cat('TOTAL CONFIRMED:', confirmed, '\n')
cat('TOTAL RECOVERED: ', recovered, '\n')
cat('TOTAL DEATHS:    ', deaths, '\n')

corona_latest %>% 
  filter(!Country.Region %in% 'Others') %>% 
  group_by(Country.Region) %>% 
  summarise(Total.Confirmed = sum(Confirmed)) %>% 
  filter(Total.Confirmed > 0) %>% 
  mutate(Log.Total.Confirmed = log(Total.Confirmed)) -> countries_confirmed

head(countries_confirmed %>% arrange(desc(Total.Confirmed)))

countries_confirmed %>%  
  arrange(desc(Total.Confirmed)) %>% 
  head(10) %>% 
  hchart("bar",hcaes(x = 'Country.Region',  y =Total.Confirmed)) #%>%
  #hc_add_theme(hc_theme_darkunica())


### Regions By Confirmed

corona_latest %>% 
  filter(!Province.State %in% c('Others', '')) %>% 
  group_by(Province.State) %>% 
  summarise(Total.Confirmed = sum(Confirmed)) %>% 
  arrange(desc(Total.Confirmed)) %>% 
  head(10) %>% 
  hchart("bar",hcaes(x = 'Province.State',  y =Total.Confirmed)) #%>%
  #hc_add_theme(hc_theme_darkunica())

data(worldgeojson, package = "highcharter")

highchart() %>%
  hc_add_series_map(worldgeojson, countries_confirmed, value = 'Log.Total.Confirmed', joinBy = c('name','Country.Region'))  %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  hc_title(text = "Countries with COVID19 exposure - Confirmed Cases")


corona_latest %>% 
  group_by(Country.Region) %>% 
  summarise(Total.Recovered = sum(Recovered)) %>% 
  filter(Total.Recovered > 0)  -> countries_recovered

highchart() %>%
  hc_add_series_map(worldgeojson, countries_recovered, value = 'Total.Recovered', joinBy = c('name','Country.Region'))  %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  hc_title(text = "Countries with COVID19 exposure - Recovered Cases")


corona_latest %>% 
  group_by(Country.Region) %>% 
  summarise(Total.Deaths = sum(Deaths)) %>% 
  filter(Total.Deaths > 0) -> countries_deaths

highchart() %>%
  hc_add_series_map(worldgeojson, countries_deaths, value = 'Total.Deaths', joinBy = c('name','Country.Region'))  %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  hc_title(text = "Countries with COVID19 exposure - Deaths")

population <- read.csv("./WPP2019_TotalPopulationBySex.csv")

head(population)

population %>%
filter(Time == '2019', PopTotal>1000) -> population_2019

population_2019 %>% 
select(Location, PopTotal) %>%
right_join(countries_confirmed, by = c("Location" = "Country.Region")) %>%
mutate(Confirmed.over.Population = Total.Confirmed/PopTotal)  %>%
arrange(desc(Confirmed.over.Population)) -> countries_confirmed_pop

head(countries_confirmed_pop, 10)

data(worldgeojson, package = "highcharter")

highchart() %>%
  hc_add_series_map(worldgeojson, countries_confirmed_pop, value = 'Confirmed.over.Population', joinBy = c('name','Location'))  %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  hc_title(text = "Countries with COVID19 exposure - Confirmed over Population")
highchart() %>%
  hc_add_series_map(worldgeojson, countries_confirmed_pop, value = 'Confirmed.over.Population', joinBy = c('name','Location'))  %>% 
  hc_colorAxis(stops = color_stops()) %>% 
  




