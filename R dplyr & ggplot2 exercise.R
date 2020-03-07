require(dplyr) #两种调用方式
library(dplyr) #调用

#安装数据
install.packages('dplyr')
install.packages('ggplot2')

#读取数据
mydata = read.csv("https://raw.githubusercontent.com/deepanshu88/data/master/sampledata.csv")
head(mydata)
dim(mydata)  # check number of columns and rows  查看行数和列数
str(mydata)# view the structure of the dataset  看数据的格式
summary(mydata)  # give a summary of variables  对每一列进行计算
# frequency table of states   每个州出现的次数
table(mydata$State)
# plot one year of income  画图函数  直方图
hist(mydata$Y2015)
#画直方图
hist(mydata$Y2009)
sample_n(mydata,3)  #随机抽取  这里随机抽取3行
sample_n(mydata,10)  # 随机抽取10行
#按百分比抽样
sample_frac(mydata,0.1)
#去重复
x1 = distinct(mydata)  
x2 = distinct(mydata, Index, .keep_all= TRUE)
dim(x2) # check number of columns and rows  查看行数和列数
head(x2) #查看数据
x2 = distinct(mydata, Index, Y2010, .keep_all= TRUE)
dim(x2)# check number of columns and rows  查看行数和列数
head(x2)

#select( ) Function 作用于列
mydata2 = select(mydata, Index, State)
mydata2 = select(mydata, Index, State:Y2008)  #选择数据
mydata2
mydata3 = select(mydata, -Index, -State)  # - 意思是去掉这一列
mydata3 = select(mydata, -c(Index,State))
mydata3 = select(mydata, starts_with("Y"))  #  mydata3 新的数据从mydata里面选择 但是只选取以Y开头的列
mydata33 = select(mydata, -starts_with("Y"))
mydata4 = select(mydata, contains("I"))  # 选择包含 I 的列  
mydata5 = select(mydata, State, everything())
mydata6 = rename(mydata, Index1=Index)
mydata7 = filter(mydata, Index == "A")



myvector = c(1,2,3,4,5,6,7,8)
myvector[myvector >=3]
summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med=median(Y2015))
class(summarise(mydata, Y2015_mean = mean(Y2015), Y2015_med=median(Y2015)))

summarise_at(mydata, vars(Y2005, Y2006), funs(n(), mean, median))

sapply(mydata,is.numeric)

mydata7 = filter(mydata,Index == 'A')

mydata %>% filter(Index == 'A') 

t = mydata %>%                       # ????????????  #?????????????????? ??????????????????  ??????????????????
  group_by(Index) %>%
  summarise_at(vars(Y2011:Y2015), funs(n(), mean(., na.rm = TRUE)))

out2 = mydata %>% 
  group_by(Index) %>% 
  mutate(Total=cumsum(Y2015)) %>%
  select(Index, Y2015, Total)

df1 = data.frame(ID = c(1, 2, 3, 4, 5),
                 w = c('a', 'b', 'c', 'd', 'e'),
                 x = c(1, 1, 0, 0, 1),
                 y=rnorm(5),
                 z=letters[1:5])
df2 = data.frame(ID = c(1, 7, 3, 6, 8),
                 a = c('z', 'b', 'k', 'd', 'l'),
                 b = c(1, 2, 3, 0, 4),
                 c =rnorm(5),
                 d =letters[2:6])
df3 = inner_join(df1, df2, by = "ID")
df3
df4 = left_join(df1, df2, by = "ID")
df4

mtcars
hist(mtcars$mpg)
#安装
install.packages(ggplot2)

#调用 ggplot2这个包
library(ggplot2)

#固定写法  aes指美学的，在aes里面把x,y 轴定义出来，这里定义的
#x = mpg，在这里先不需要y轴
#查看cheet shit  geom指的是几何，这个里面需要定义做什么图形折线图，直方图
#  geom_density 曲线图  geom_freqpoly 折线图

#geom_histogram指的是直方图 画出来的就是黑白的的直方图
ggplot(mtcars, aes(x = mpg)) + geom_histogram()  

#然后在geom_histogram()里面添加内部颜色fill = 'yellow' 和 边框颜色 color= 'red'
#ggtitle('my first histogram') 添加标题
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(color= 'red',fill = 'yellow')+ggtitle('my first histogram')
#折线图
ggplot(mtcars, aes(x = mpg)) +
  geom_freqpoly(color= 'red',fill = 'yellow')+ggtitle('my first histogram')

#分组 把fill提到 aes()里面  把不同的值涂成不同的颜色
ggplot(mtcars, aes(x = mpg,fill = factor(vs))) +
  geom_histogram()+ggtitle('my first histogram')

#更改x轴的名称
ggplot(mtcars, aes(x = mpg,fill = factor(vs))) +
  geom_histogram()+ggtitle('my first histogram')+
  labs(x='New name')

