dataframeMat1 <- matrix(1:15,ncol =3, byrow=T)
dataframeMat1
mydataframe <- data.frame(dataframeMat1)
mydataframe
dataframeMat1[,1]
mydataframe[,1]


#matrix로 정의된 데이터를 dataframe으로 변경하여 작업하는 경우가 많음
#Matrix의 1열만 char타입으로 변경
dataframeMat1[,1] <- as.character(dataframeMat1[,1]) 
dataframeMat1
#이렇게 하면 1열만 바뀌는게 아니라, 전체가 다 바뀌어있다.
#Matrix는 한 타입으로만 선언해야 하므로, 한 열의 타입을 변경해도 모든 데이터의 타입이 변경된다.
#하지만 dataframe은 여러 타입을 적용할 수 있다.
mydataframe[,1] <- as.character(mydataframe[,1])

#str함수는 dataframe 내부의 데이터형을 볼 수 있는 함수
str(mydataframe)

mydataframe$X1 #$를 이용해서 열의 이름을 접근할 수 있다.
mydataframe$X2
mydataframe$X3

#dataframe에 열을 추가
col4 <- c(1,1,1,1,1)
mydataframe$x4 <-col4
mydataframe

#필요한 곳에서 dataframe을 다시 matrix로 변환 
dataframeMat2 <- as.matrix(mydataframe)
dataframeMat2
