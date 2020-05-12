library(dplyr)
eksel = read.csv('datas.csv')
library(tidyverse) 
eksel2 = readxl::read_xls("Superstore Dataset.xls")

testo = read_xls('tesuto.xls')

write.csv(select(eksel2, c(City,Category,Profit,Sales,Segment)),'eksel.csv')

eksel3 = read.csv('eksel.csv')

test = filter(eksel3, Category == "Furniture")
test = filter(eksel3, Category == "Furniture" & City == "New York City")
test = mutate(eksel3, work = 'Succes')
test = transmute(eksel3, kolom_baru = City)

piping = eksel3 %>%filter(Category == "Furniture") 
%>%mutate(work = 'Succes') %>%select(c(City,Category,Segment, work))

write_excel_csv(select(eksel2, c(City,Category,Profit,Sales,Segment)),'tesuto.csv')

