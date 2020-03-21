#ggplot2패키지에서 제공되는 mpg데이터를 분석
####step1. mpg를 dataframe으로 변경####
mpg <- as.data.frame(mpg)
class(mpg)

####step2. mpg의 정보를 출력####
#행의 갯수, 열의 갯수, 위에서 10개, 끝에서 10개 출력
nrow(mpg)
ncol(mpg)

head(mpg, n=10)
tail(mpg, n=10)

####step3. mpg의 컬럼명을 변경 ####
#cty => city, hwy => highway
mpg <- rename(mpg,city=cty)
mpg <- rename(mpg,highway=hwy)

####step4. 파생변수 생성하기####
#total 컬럼을 추가 = >cty와 hwy의 합
# av컬럼을 추가 => cty와 hwy의 평균 
####step5.생성된 total을 가지고 요약정보 확인#### 
mpg$total <-as.numeric(mpg$city+mpg$highway)
mpg$av <- as.numeric(mpg$total/2)

str(mpg)

####step6.info컬럼 추가####
#total값을 이용해서 평가 - 20이상이면 pass, fail

mpg[,"info"] <- ifelse(test=mpg$total>=30,
                       yes="pass",
                       no="fail")

####step7. grade컬럼 추가 ####
#total값을 이용해서 평가 - 40이상이면 A, 35이상이면 B, 30이상이면 C, 나머지는 D등급 

mpg[,"grade"] <- ifelse(test=mpg$total>=40,
                    yes="A",
                    no=ifelse(test=mpg$total>=35,
                              yes="B",
                              no=ifelse(test=mpg$total>=30,
                                        yes="C",
                                        no="D")))
mpg

write.csv(mpg,file="mpg_result.csv")

