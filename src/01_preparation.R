library(tidyverse)
library(rvest)
library(httr)
library(curl)
library(here)
library(jsonlite)
library(RCurl)
library(RJSONIO)
library(rromeo)
library(stringi)
library(rio)
library(lubridate)
library(rvest)
library(plotly)
library(gapminder)
library(htmlwidgets)

#URL

#Congress members
senator <- "https://api.propublica.org/congress/v1/117/senate/members.json"
rep <- "https://api.propublica.org/congress/v1/117/house/members.json"

#Bill voted by the Congress
bill <- "https://api.propublica.org/congress/v1/117/both/bills/passed.json"

#Votes by Congress Chambers
votes <- "https://api.propublica.org/congress/v1/117/{CHAMBER}/sessions/{1/2}/votes/{NNN}.json"
##{NNN} goes from 1 to 528

votes_date <- "https://api.propublica.org/congress/v1/{CHAMBER}/votes/{FROM DATE}/{TO DATE}.json"
votes_mon <- "https://api.propublica.org/congress/v1/senate/votes/{YEAR}/{MONTH}.json"

#Statements
stat_word <- "https://api.propublica.org/congress/v1/statements/search.json?query={TERM}"
stat_mem <- "https://api.propublica.org/congress/v1/members/{MEMBER CODE}/statements/117.json"


#USEFUL
cosp <- "https://api.propublica.org/congress/v1/117/bills/{bill-id}/cosponsors.json"
bill_int <- "https://api.propublica.org/congress/v1/117/senate/bills/introduced.json"
bill_upd <- "https://api.propublica.org/congress/v1/117/senate/bills/updated.json"
bill_act <- "https://api.propublica.org/congress/v1/117/senate/bills/active.json"
bill_pas <- "https://api.propublica.org/congress/v1/117/senate/bills/passed.json"
bill_ena <- "https://api.propublica.org/congress/v1/117/senate/bills/enacted.json"
bill_vet <- "https://api.propublica.org/congress/v1/117/senate/bills/vetoed.json"