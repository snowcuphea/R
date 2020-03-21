#mpg 데이터의 class는 "suv","compact"등 자동차를 특징에 따라 일곱 종류로 분류한 변수입니다. 어떤 차종의 도시 연비가 높은지 비교해 봅시다. class별 cty평균을 구해 보세요.
library("ggplot2")
data(mpg)
head(mpg)

mympg <- data.frame(mpg)
mympg
head(mympg)

mympg %>% 
  group_by(class) %>% 
  summarise(cty_avg=mean(cty))


#어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty평균이 높은순으로 정렬해 줄력하세요.
mympg %>% 
  group_by(class) %>% 
  summarise(cty_avg=mean(cty)) %>% 
  arrange(desc(cty_avg))

# hwy평균이 가장 높은 회사 세 곳을 출력하세요.
mympg %>% 
  group_by(manufacturer) %>% 
  summarise(hwy_avg=mean(hwy)) %>% 
  arrange(desc(hwy_avg)) %>% 
  head(n=3)


# 각 회사별 compact 차종 수를 내림차순으로 정렬해서 출력
mympg %>% 
  group_by(manufacturer) %>% 
  summarise(compact_num = sum(class=="compact")) %>% 
  arrange(desc(compact_num))


