dataset = read_xls('Superstore Dataset.xls')
summary(dataset)
write.csv(dataset, 'datasetcsv.csv')
install.packages("tidyverse")
library(dplyr)
glimpse(dataset)
select(dataset, c(City,Category,Profit,Sales,Segment))
write.csv(select(dataset, c(City,Category,Profit,Sales,Segment)),'datas.csv')

library(tidyverse)

write.csv(dataset, 'datasetcsv.csv')
