install.packages("N2H4")
library(N2H4)
library(stringr)
library(dplyr)




#css의 선택자를 활용할 수 있는 방법 - rvest
install.packages("rvest")
library(rvest)

url <- "https://www.clien.net/service/group/community?$od=T31&po=0"

readPage <- read_html(url)

# html_nodes(선택자) : 일치하는모든 태그를 추출
# html_node(선택자) : 일치하는 태그 한 개
# html_text() : 텍스트를 추출
# html_children() : 하위 노드 추출
# html_attr() : attribute 추출 

readPage %>% 
  html_nodes("span.subject_fixed") %>% 
  #이런 이름으로 정의되어있는 모든 태그들을 뽑아온다. 
  html_text() -> title_data
title_data
