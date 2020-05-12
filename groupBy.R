testo = read_xls('tesuto.xls')
testo %>% group_by(Category) %>% summarise(jumSales = mean(Profit), jumProfit =mean(Profit))
library(tidyverse)

besto = read_xls('tesuto.xls')
besto %>% group_by(Category) %>% summarise(jumSales = mean(Profit), jumProfit =mean(Profit))

lestuto = readxl::read_xls('tesuto.xls')

lestuto %>% group_by(Category, Segment) %>% 
  summarise(jumSales = sum(as.numeric(Sales)), rataProfit =mean(as.numeric(Profit))
            ,minSales = min(as.numeric(Sales)), maxProfit = max(as.numeric(Sales)),
            nHal = n())

dataA = lestuto %>% filter(Category == 'Furniture') %>% head(10)
dataB = lestuto %>% filter(Segment == 'Consumer') %>% head(10)

intersect(dataA, dataB)
union(dataA, dataB) /
bind_rows(dataA, dataB) 
setdiff(dataA, dataB)
setdiff(dataB, dataA)
bind_cols(dataA, dataB)
inner_join(dataA, dataB)
full_join(dataA, dataB)
left_join(dataB, dataA)
right_join(dataA, dataB)
