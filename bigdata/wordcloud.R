install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("KoNLP")
install.packages("Sejong")
install.packages("hash")
install.packages("rJava")
install.packages("tau")
install.packages("RSQLite")
install.packages("devtools")
library(KoNLP)
library(stringr)
library(RColorBrewer)
library(wordcloud)



useSejongDic()
######KoNLP의 함수를 테스트######
# 명사만 추출하는 함수  
extractNoun("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")
SimplePos09("롯데마트가 판매하고 있는 흑마늘 양념 치킨이 논란이 되고 있다.")
convertHangulStringToKeyStrokes("R는 많은 공헌자에의한 공동 프로젝트입니다")



#### 분석할 샘플데이터 로딩
load("comments.RData")
load("score.RData")

length(comments)
length(score)
head(comments,10)
head(score,10)

sampledata <- comments[1:1000]
class(sampledata)

#### 형태소 분석을 하기위해서 명사 분리 ####
data_list = list() #댓글을 분리하ㅣ면 분리된 명사의 갯수가 다르므로, 리스트를 이용
for(i in 1:length(sampledata)){
  data <- SimplePos09(sampledata[i])
  data_list[[i]] <- data
}
head(data_list,20)

# /로 분할 - 리스트의 모든 요소에 저장된 문자열을  /로 분할
#           => N이 있는 문자열의 첫번째 요소
## sapply를 이용하면 반복작업을 할 수 있다.
sapply(data.frame(test=c(1,2,3,4,5,6),
                  test2=c(3,3,3,3,3,3)
                  ), #반복작업할 데이터 data.frame(test=c(1,2,3,4,5,6),test2=c(3,3,3,3,3,3))

       function(x){
         x[1]
         #반복해서 적용할 함수
       }
       
       )

#리스트를
class(unlist(data_list))

wordlist <- sapply(str_split(unlist(data_list),"/"), function(x){x[1]})

#wordlist <- sapply(str_split(data_list,"/"),function(x){x[1]})
class(wordlist)
head(wordlist,20)
head(data_list,20)

#table함수를 이용해서 단어의 빈도수를 구하기
#table함수는 벡터에 저장되어 있는 모든 단어들의 빈도수를 계산해서 변환
# -> 단어를 이용해서 변수명으로 사용 
tablewordlist <- table(wordlist)
tablewordlist[1]
tablewordlist[89]
names(tablewordlist)

#분석한 데이터를 이용해서 sort
sort(tablewordlist,decreasing = T) [1:100]

#분석결과를 가지고 기준을 적용해서 정리
# -> 글자 수 중에서 1글자만 있는 것은 제외하기
nchar("글자수")
tablewordlist_result <- tablewordlist[nchar(names(tablewordlist))>1]
tablewordlist_result <- sort(tablewordlist_result,decreasing = T) [1:100]
tablewordlist_result

#RColorBrewer
#모든 색상 팔레트를 보여준다.
display.brewer.all(n=10, exact.n = F)
brewer.pal.info
display.brewer.all(type="div")
display.brewer.all(type="qual")
display.brewer.all(type="seq")

#분석한 결과가 저장되어 있는 tablewordlist_result의 값을 단어와 숫자로 각각 저장 
word <- names(tablewordlist_result)
count <- as.numeric(tablewordlist_result)
mycolor <- brewer.pal(n=11,name="Spectral")
wordcloud(words=word, freq=count,random.order=F,colors=mycolor,scale=c(4,0.3))
#random.order=F : 빈도수 높은 거 가운데에 놓기