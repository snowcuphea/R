install.packages("mongolite")
library("stringr")
library("mongolite")


con <- mongo(collection = "crawl",
             db = "bigdata",
             url = "mongodb://127.0.0.1")


#0번부터 9번 페이지까지 반복 작업
final_data_list=NULL
for(i in 0:9){
  
  #페이지마다 연결할 주소가 달라지므로 변수로 처리 
 myurl <- paste0("https://www.clien.net/service/group/community?$od=T31&po=",i)
 url_data <- readLines(myurl,encoding="UTF-8")

####title추출####
 final_filter_data <- url_data[str_detect(url_data,"subject_fixed")]
 title <- str_extract(final_filter_data,"(?<=\">).*(?=</span>)")
 
 hit_data <- final_filter_data[str_detect(final_filter_data,"<span class=\"hit\">")]
 hit <- str_extract(hit_data,"(?<=\">).*(?=</span>)")[-1]


 myurl <- url_data[(which(str_detect(url_data,"subject_fixed"))-3)]
 url_val <- str_extract(myurl,"(?<=href=\").*(?=data-role)")
 url_val <- str_sub(url_val, end= -3)
 url_val <- paste0("http://www.clien.net", url_val)
 
 #### url을 이용해서 content항목 추출 ####
 #content를 담을 리스트
 contentlist=NULL #최초변수 선언 시 null로 초기화 
 content_filter_data=NULL
 for(page in 1:length(url_val)){
   contentdata <- readLines(url_val[page],encoding = "UTF-8")
   start = which(str_detect(contentdata,"post_content"))
   end = which(str_detect(contentdata,"post_ccls"))
   
   #데이터 정제 
   content_filter_data <- contentdata[start:end]
   content_filter_data <- paste(content_filter_data,collapse="")
   content_filter_data <- gsub("<.*?>","",content_filter_data)
   content_filter_data <- gsub("\t|&nbsp;","",content_filter_data) 

   
   #기존의 저장되어 있는 contentlist의 내용에 추가 
   contentlist <- c(contentlist,content_filter_data)
   
  # cat("\n",page)
 }
 
 final_data <- cbind(title,hit,url_val,contentlist)
 final_data_list <- rbind(final_data_list,final_data)
 #cat("\n",i)

}


write.csv(final_data_list,"crawl_data5.csv")
save(final_data_list,file="crawl_data5.RData")


###########mongodb에 저장하기 ############
if(con$count()>0){
  con$drop()
}

####mongodb에 데이터를 저장하기 위해서 dataframe으로 변환####
final_mongo_data <- data.frame(final_data_list)
con$insert(final_mongo_data)
