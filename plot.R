install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyverse")

library(ggplot2)
library(dplyr)
eksel = readxl::read_xls("Superstore Dataset.xls")
write.csv(select(eksel, c(City,Category,Profit,Sales,Segment,
                          'Order Date', 'Sub-Category')),'bener.csv')

bener = readxl::read_xls('bener.xls')

dataA = bener %>% filter(as.numeric(Profit), as.numeric(Sales))) %>% head(10)
dataB = bener %>% head(30)
#point chart
ggplot(dataA, aes(x = Profit, y = Sales)) + geom_point(colour = 'red')          

ggplot(dataB, aes(X = Profit)) + geom_histogram()          
ggplot(dataB, aes(x = Sales)) + geom_histogram()
ggplot(dataB, aes(x = Segment, y = Profit) + geom_bar(stat = 'identity', fill = 'blue')        
ggplot(dataB, aes(x=Segment, y=Sales)+ geom_bar(stat = 'identity'))
ggplot(dataA, aes(x = Segment, y = Profit) + geom_bar(stat = 'identity', width = 0.5, aes(fill=Category))        
              
salesPerSegment = dataA %>% group_by(Segment) %>% summarise(totSales = sum(Sales))   
#pie chart
ggplot(salesPerSegment, aes(x="", y=totSales, fill=Segment)) + geom_bar(stat='identity',width = 1) + coord_polar("y", start = 0)

dataB$OrderDate = as.Date(dataB$OrderDate)
dataB$OrderYear = as.Date(cut(dataB$OrderDate, breaks = ('year')))
ggplot(dataB, aes(x=OrderYear, y=Sales)) + stat_summary(fun = sum, geom = 'line')

#point line
yearSales = dataB%>%group_by(OrderYear)%>%summarise(jumSale = sum(Sales))
ggplot(yearSales, aes(x=OrderYear, y=jumSale)) + geom_line() + geom_point(colour="blue")
       