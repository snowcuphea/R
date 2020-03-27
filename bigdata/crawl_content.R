load(file = "crawl_data.RData")
library("stringr")
library("mongolite")

final_data

class(final_data$url_val)
final_data$url_val <- as.vector(final_data$url_val)


urllist <- final_data[,3]

contentdata<- readLines(urllist[1],encoding="UTF-8")

contentdata

#원하는부분만 가지고 오기 
start = which(str_detect(contentdata,"post_content"))
end = which(str_detect(contentdata,"post_ccls"))

start
end

content_filter_data <- contentdata[start:end]
content_filter_data

#데이터 정제하기 
#1. 벡터로 리턴하므로 한 개로 합치기
content_filter_data <- paste(content_filter_data,collapse="")
content_filter_data

#2. 불필요한 기호나 태그 없애기
content_filter_data <- gsub("<.*?>","",content_filter_data) # <.    `<`로 시작하고 /  ?     `>`로 끝나는 모든 것
content <- gsub("\t|&nbsp;","",content_filter_data) #스페이스랑 탭버튼 모두 지움 
content
