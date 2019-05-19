# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

#Convert catagorical data into numerics
dataset$State=factor(dataset$State,
                     levels = c('New York','California','Florida'),
                     labels = c(1,2,3))

# Splitting the dataset into the Training set and Test set
 #install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fit multiple linear regression to trainging set
regressor =lm(formula= Profit ~ R.D.Spend+Administration+ Marketing.Spend+State,data= training_set)
#Or can be written as regressor =lm(formula= .,data=training_set)

#predict
y_pred= predict(regressor,newdata = test_set)

#backward elimination
regressor =lm(formula= Profit ~ R.D.Spend+Administration+ Marketing.Spend,data= training_set)

regressor =lm(formula= Profit ~ R.D.Spend+ Marketing.Spend,data= training_set)

regressor =lm(formula= Profit ~ R.D.Spend+ Marketing.Spend,
              data= training_set)
