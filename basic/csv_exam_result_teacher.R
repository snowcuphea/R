mydata <- read.csv("csv_exam.csv")
mydata
mydataResult <- mydata[mydata$science>=80,]
mydataResult

mydataResult$mytotal <- as.numeric(mydataResult$math+mydataResult$english+mydataResult$science)
mydataResult$myavg <- as.numeric(mydataResult$mytotal/3)
mydataResult

write.csv(mydataResult,file="result_teacher.csv")
