library('rolr')

path <- "PerformanceEvaluation.csv"
df <- read.csv(path)

df_train <- subset(df, df$DataSplit == "Train")
df_test <- subset(df, df$DataSplit == "Test")

train_times <- df_train$SURVIVAL
train_status <- df_train$DEAD
train_scores <- df_train$SurvPred

rhier(train_times, train_status, train_scores, ns = 25, alt = "decrease", method = "exact")

df$STAGE <- df$SurvPred
df$STAGE <- ifelse(df$SurvPred > 172.7333, 3, df$STAGE)
df$STAGE <- ifelse(df$SurvPred >93.07971 & df$SurvPred < 172.7333, 2, df$STAGE)
df$STAGE <- ifelse(df$SurvPred < 93.07971, 1, df$STAGE)
df$STAGE