#EDA Process

#Add Libraries
library(RColorBrewer)
library(corrplot)

#Structure and Summary of the sales data
str(diamonds_sale)
summary(diamonds_sale)
dim(diamonds_sale)

#Stat Summary for Price vs Cut
ggplot(data = diamonds_sale) +
  ggtitle("Medium PRICE based on CUT") +
  stat_summary(
    mapping = aes(x = cut, y = price),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#Stat Summary for Price vs Cut
ggplot(data = diamonds_sale) +
  ggtitle("Medium PRICE based on Color") +
  stat_summary(
    mapping = aes(x = color, y = price),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#Stat Summary for Price vs Cut
ggplot(data = diamonds_sale) +
  ggtitle("Medium PRICE based on Clarity") +
  stat_summary(
    mapping = aes(x = clarity, y = price),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#Relation between carat + color vs price  
ggplot(data = diamonds_sale, aes(x = carat, y = price, colour = color)) +
  ggtitle("CARAT + COLOR vs PRICE") +
  geom_point(alpha = 0.8, position = position_jitter(width = 0.1, height = 0)) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"))
  
#Relation between carat + cut vs price  
ggplot(data = diamonds_sale, aes(x = carat, y = price, colour = cut)) +
  ggtitle("CARAT + CUT vs PRICE") +
  geom_point(alpha = 0.8, position = position_jitter(width = 0.1, height = 0)) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"))

#Relation between carat + clarity vs price  
ggplot(data = diamonds_sale, aes(x = carat, y = price, colour = clarity)) +
  ggtitle("CARAT + CLARITY vs PRICE") +
  geom_point(alpha = 0.8, position = position_jitter(width = 0.1, height = 0)) +
  scale_color_brewer(palette = "Set2") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic"))

#Correlation Plot
#Make a backup of the diamonds_sale
diamonds_1 <- diamonds_sale

#Convert to numeric
diamonds_1$cut <- as.numeric(diamonds_1$cut)
diamonds_1$clarity <- as.numeric(diamonds_1$clarity)
diamonds_1$color <- as.numeric(diamonds_1$color)


#Compute the plot
c_plot <- cor(diamonds_1[,c("price","carat","color","cut","clarity")])

#Correlation Plot presentaion
corrplot(c_plot, method = "color", type = "upper",
         tl.col = "black",
         tl.srt = 45,
         addCoef.col = "black",
         addCoef.cor = TRUE,
         number.cex = 0.7,
         tl.cex= 0.7)

#Linear Plot (not used)
ggplot(diamonds_1, aes(x=x, y=price)) +
  geom_point() +
  geom_smooth(method="lm")