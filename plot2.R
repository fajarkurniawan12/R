library(ggplot2)
library(dplyr)

bener = readxl::read_xls('bener.xls')
dataC = bener %>% head(300)

plotA = ggplot(dataC, aes(x = Profit, y = Sales))+ 
  geom_point(aes(color = Category), size = 2, shape=18)+ 
  geom_smooth(method = 'lm', linetype = 'dashed')+
  labs(title='Profit lvel Sales', subtitle = 'Pertarungan Angka',caption = 'R Language')+
  xlab("GrsSales1")+ylab("GrsProfit1")+
  theme(
    plot.title = element_text(color = 'green', size=12, face = 'bold'),
    plot.subtitle = element_text(color = 'red', size=13, face = 'italic')
  )

plotA  

plotB = plotA + theme(
  legend.position = c(0.1,0.2),
  legend.text =  element_text(color = 'blue', size=12, face = 'bold'),
  legend.title =  element_text(color = 'purple', size=12, face = 'bold')
  )

plotB

ggsave('hasilPlot1.png', plotA)
ggsave('hasilPlot2.png', plotB)

