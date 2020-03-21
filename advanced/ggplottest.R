install.packages("ggplot2")
library("ggplot2")

mydata <- c("java","spring","bigdata","android")
qplot(mydata)
qplot(data=mpg,x=hwy)#mpg:들어가있는 예제데이터이름.  x는 컬럼명명

qplot(data=mpg,x=hwy,y=drv)#mpg:들어가있는 예제데이터이름.  

qplot(data=mpg,x=drv,y=hwy,geom="line")

qplot(data=mpg,x=drv,y=hwy,geom="boxplot")

qplot(data=mpg,x=drv,y=hwy,geom="boxplot",colour=drv)
