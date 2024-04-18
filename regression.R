#Install Packages
install.packages("caret")

#Add package to library
library(caret)

#Set Seed
set.seed(123)

#Train Set and Test Set - %80 of training data 20% of test data.
split_index <- createDataPartition(diamonds_sale$price, p = 0.8, list = FALSE)
train_set <- diamonds_sale[ split_index,]
test_set  <- diamonds_sale[-split_index,]

#Single Linear Module
modelSingle <- lm(price ~ carat, data = train_set)

#Summary Single Linear Module
summary(modelSingle)

#Multi Linear Module
model_Multi <- lm(price ~ carat + cut + color + clarity, data = train_set)

summary(model_Multi)

plot(model_Multi)

#Visual representation Linear
ggplot(train_set, aes(x = carat, y = price)) + geom_point() + 
  geom_smooth(method = "lm") +  
  ggtitle('Scatterplot of price by carat') +
  geom_point(alpha = 0.8, position = position_jitter(width = 0.1, height = 0)) +
  scale_color_brewer(palette = "Set2") +
  theme_light() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold.italic")) 

#Visual representation Multi
ggplot(model_Multi, aes(.fitted, .resid)) + 
  geom_point() + 
  geom_hline(yintercept = 0, linetype = "dashed") +
  ggtitle("Residuals vs. Fitted Values")

#Predictions    
predictions <- predict(model_Multi, newdata = test_set)

#Validation
MSE <- mean((predictions - test_set$price)^2)  
RMSE <- sqrt(MSE)                             
MAE <- mean(abs(predictions - test_set$price))  
R2 <- cor(test_set$price, predictions)^2

#Print results of validation
print(paste("MSE:", MSE))
print(paste("RMSE:", RMSE))
print(paste("MAE:", MAE))
print(paste("R-squared:", R2))