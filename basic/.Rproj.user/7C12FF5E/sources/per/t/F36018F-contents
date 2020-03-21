#csv는 기본패키지로 사용가능
#csv를 읽기
mdf <- read.csv("csv_exam.csv")
mdf
mdf[2,]

#dataframe에서 조건에 만족하는 데이터를 조회
m <- matrix(1:20,ncol=4)
m
d <- data.frame(m)
d


myresult <- d[d$X3>=13,]
myresult

#조건에 만족하는 데이터를 result.csv로 저장
write.csv(myresult,file="result.csv")



mycsv <- read.csv("csv_exam.csv")
mycsv

result <- mycsv[mycsv$science>=80,]
result


result$mytotal <-(result$math+result$english+result$science)
result$myavg <-result$mytotal
result
write.csv (result,file="csv_exam_result.csv")

k <- 0
for(i in result[,1]){
  k <- k+1
 # if(i==result[k,1]){
    result[k,6] <- sum(result[k,3:5] )
 # }
  
}
result


