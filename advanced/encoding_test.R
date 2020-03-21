install.packages("data.table")
library("data.table") #install.packages와 library는 가독성을 위해 맨 위로 올려준다. 


df <- data.frame(mydata1=1:5, #1~5
                 mydata2=letters[1:5], # a~e
                 mydata3=c("이민호","android","@한글%$@","test","한글"))
df
####파일write####
write.csv(df,"encoding_test.csv",row.names = FALSE)
write.csv(df,"encoding_test_euckr.csv",row.names = FALSE, fileEncoding = "euc-kr")
write.csv(df,"encoding_test_cp949.csv",row.names = FALSE, fileEncoding = "cp949")
write.csv(df,"encoding_test_utf8.csv",row.names = FALSE, fileEncoding = "utf8")
####깨진파일 처리하기####
read.csv("encoding_test_utf8.csv") #오류가 나면 읽어지지 않는다.
readLines("encoding_test_utf8.csv") #오류가 나도 읽어진다. 
readLines("encoding_test_utf8.csv", encoding="UTF-8")

#data.table - dataframe보다 강력
dftable <- fread("encoding_test_utf8.csv") #fread는 datatable에서 지원하는 function
head(dftable)

#인코딩함수
Encoding(dftable$mydata3) = "UTF-8"
head(dftable)