dataset = read.csv('Dataset_superstore_simple.csv')
library(dplyr)
library(tidyverse)
library(ggplot2)

# No.1 Carilah customer_id yang memiliki sales paling besar
no1 = dataset %>% group_by(order_id) %>% summarise(maxSales = max(sales))

no1 = select(dataset,order_by('sales'))

no1 = select(dataset, c(category,profit,segment, maxSales = max('sales')))

# No.2 Sub-category apa saja yang ada di dalam category 'Office Supplies', 
# dan masing-masing berapa banyak total profitnya

no2 = dataset %>%filter(category == "Office Supplies") %>% group_by(sub_category)%>%
  summarise(totProf = sum(profit), totSales = sum(sales)) 

#no.3 Berapa banyak order yang menghasilkan profit negatif (rugi)
no3 = dataset %>%filter(profit < 0)  
count(no3)

#no.4 Antara 3 customer_id ini, mana yang total sales-nya paling banyak: JE-16165,KH-16510, AD-10180

test4 = filter(dataset, customer_id == "JE-16165")
test41 = filter(dataset, customer_id == "KH-16510")
test42 = filter(dataset, customer_id == "AD-10180")

test = filter(dataset, customer_id %in% c("JE-16165", "KH-16510", "AD-10180"))

no4 = test %>%group_by(customer_id) %>% summarise(totSales = sum(sales)) 

#No.5 Buatlah data frame bernama 'yearly_sales' yang berisi total sales, jumlah
#customers, dan total profit tiap tahun. Tahun berapa profit tertinggi diperoleh?

dataset$order_date = as.Date(dataset$order_date)

tahun = dataset$order_year = as.Date(cut(dataset$order_date, breaks = ('year')))

tahun1 = dataset %>% group_by(order_year) %>%summarize(totSales = sum(sales),totProfit = sum(profit),jumCustomer = count(order_id))

no5 = dataset %>% group_by(order_year,sales,profit) %>% summarise(totSales = sum(sales), 
                  totProfit = sum(profit), nHal = n())

no5 = tahun %>% summarise(totSales = sum(sales),totProfit = sum(profit)) %>% group_by(order_year, totSales, totProfit) 


# No.6 Buatlah scatterplot antara sales dan profit untuk data di tahun 2014-2015 saja,
# bedakan warnanya antara tahun 2014 dan tahun 2015. Beri judul 'Sales vs Profit 2014-2015'! 

datano6 = dataset %>%filter(order_date >= "2014-01-01", order_date <= "2015-12-31") 
dataset$order_year = as.Date(cut(dataset$order_date, breaks = ('year')))

no6 = ggplot(datano6, aes(x = profit, y = sales)) + geom_point(aes(color = cut(order_year, breaks = ('year'))))+
labs(title = 'Sales vs Profit 2014-2015', subtitle = 'Pertarungan Angka',caption = 'R Language')+
theme( legend.position = c(0.8,0.1),
    legend.text =  element_text(color = 'blue', size=10, face = 'bold'),
    legend.title =  element_text(color = 'green', size=10, face = 'bold'))

#No.7 Buatlah barchart yang berisi total profit dari 10 customer dengan total sales
#tertinggi di tahun 2015

ggplot(dataset, aes(x = Segment, y = Profit) + geom_bar(stat = 'identity', width = 0.5, aes(fill=Category)))
       
datano7 = dataset %>% group_by(customer_id)%>%filter(order_date >= "2015-01-01", order_date <= "2015-12-31")%>% 
  summarise(totSales = sum(sales), totProfit = sum(profit))

no7 = ggplot(datano7, aes(x=totProfit, y=totSales))+geom_point(aes(customer_id))


