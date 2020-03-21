#matrix는 행렬
matrix(1:15)
#? matrix
mymat1 <- matrix(1:15,ncol=3) # 3열로 작성 
mymat1

#1부터 15까지의 값을 3개의 열로 표현하면서, row방향 값을 추가
mymat1 <- matrix(1:15,ncol=3,byrow = T)
mymat1

#matrix에서 원하는 값을 추출하기
#행, 열
mymat1[2,2]
mymat1[3,3]
mymat1[1,c(1:3)]

mymat1[1,] #1행의 모든 열
mymat1[,1] #1열의 모든 값 

#1행과 3행을 뺀 데이터
mymat1[-c(1,3),]


#미니실습1 - 2행부터 4행까지 출력. (단, 2번 3번 컬럼만 )
mymat1[2:4,c(2,3)]

#cbind : 컬럼을 추가하는 함수. 값이 부족하면, 맨 앞의 값이 채워진다.
addmymat1 <- cbind(mymat1,c(1,11,11,1111))
addmymat1

#rbind : row를 추가하는 함수. 값이 부족하면, 맨 앞의 값이 채워진다.
addmymat2 <-rbind(mymat1,c(1,111))
addmymat2

colnames(mymat1) <- c("a","b","c")
mymat1
rownames(mymat1) <- c("r1","r2","r3","r4","r5")
mymat1

rmat <- matrix(c(80,90,70,100,80,99,78,72,90,78,82,78,99,89,78,90),ncol=4,byrow=T)
rmat
colnames(rmat) <- c("국어","영어","과학","수학")
rownames(rmat) <- c("kim","jang","hong","jang")
rmat

avg_name <-c(mean(rmat[1,]),mean(rmat[2,]),mean(rmat[3,]),mean(rmat[4,]))
avg_name
avg_subject <-c(mean(rmat[,1]),mean(rmat[,2]),mean(rmat[,3]),mean(rmat[,4]))
avg_subject
