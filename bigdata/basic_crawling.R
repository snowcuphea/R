install.packages("mongolite")
library("stringr")
library("mongolite")

url <- "https://www.clien.net/service/group/community?$od=T31&po=0"

url_data <- readLines(url,encoding="UTF-8")
url_data

#class(url_data) #타입확인용 
#length(url_data) #길이확인용
head(url_data)
tail(url_data)

#==============================================
url_data[200]
#조건에 만족하는 데이터를 필터링
#문자열에 패턴을 적용해서 일치여부를 T/F로 리턴


#### 데이터 필터링 : title ####
# 1. str_detect(패턴을 검사할 문자열,패턴)를 이용해서 웹페이지 전체에서 필요한 데이터만 먼저 추출 
# str_detect : 패턴일치하는지 여부 검사
filter_data <- url_data[str_detect(url_data,"subject_fixed")]

# 2. 추출한 데이터 전체에서 내가 필요한 문자열만 추출
#str_extract -> 패턴에 일치한 데이터를 문자열을 리턴
#전방탐색, 후방탐색을 함께 사용 
#str_extract(filter_data,"(?<=).*(?=)")
title <- str_extract(filter_data,"(?<=\">).*(?=</span>)")
title




#### 데이터 필터링 : hit 조회수 ####
# 조회수 는 모두 같은 패턴이므로,그냥 태그로 뽑는다.
# `"`를 인식시킬 수 있게, 앞에 \ 를 적어준다.
hit_data <- url_data[str_detect(url_data,"<span class=\"hit\">")]
hit_data

hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")
hit


#### 데이터 필터링 : url ####

str_detect(url_data,"subject_fixed")


myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]

myurl

url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
url_val

#필요없는 문자열을 잘라내기 : end = 3 : 뒤에서 3개를 잘라내기 
url_val <- str_sub(url_val, end= -3)
url_val <- paste0("http://www.clien.net", url_val)
url_val


####csv파일로 생성####
final_data <- cbind(title, hit, url_val)
final_data
write.csv(final_data,"crawl_data.csv")

length(title)
length(hit)
length(url_val)
