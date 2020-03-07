#R learning  creat by Jackson

#Lecture 4
#1.
install.packages('caret')
require(caret)
caret:

#2. 加减乘除 
2 + 3  # the space around '+' is optional
2 * 3  #=> 6
10 / 3  #=> 3.3, 10 by 3
total <- 2+3
sqrt(36)  #=> 6, square root
log10(100)  #=> 2, log base 10
10 %/% 3  #=> 3, quotient of 10 by 3
10 %% 3  #=> 1, remainder of 10 by 3

#3.赋值
x <-10
y = 'apple'
#class() 函数属性查询
class(x)
class(y)
xx <- c(1,2,3,4)

#4.类型转换
a = 10
a <- as.character(a)
a <- as.numeric(a)
a <- as.integer(a)
print(a)  # prints out the value of a
class(a)  # character
class(as.numeric(a))
class(a)

#5.表格查询  cars是一个表格
cars
#输出第一列的数值 格式 表格名 $ 列名
cars$speed
#第二列数值
cars$dist
#提取第几行第几列
cars[2,2]    #第二行的第二列
cars[3,1]    #第三行的第一列
cars[1, ]    #第一行
cars[5, ]    #第五行
cars[ ,2]    #第二列
cars[1:10, ] #前10行
cars[1:10,2] #前十行的第二列

#6.R包的安装
installed.packages()

if (!'car' %in% installed.packages()[, 1]) 
  {
  install.packages('car')
  }

installed.packages()[, 1]  # 提取第一列  看看package的名字

#require() 查找car 这个包
require(car)
#使用library() 调出需要使用的package
library(car) 

#7.使用help命令
help(merge)     # get help page for 'merge'
?merge          # lookup 'merge' from installed pkgs
??merge         # vague search
example(merge)  # show code examples

getwd()  # gets the working directory 查询工作路径
setwd(dirname)  # set the working directory to dir name 更改工作路径

#8.数据的导入和导出
# import "|" separated .txt file  读取table 表格
myData <- read.table("c:/myInputData.txt", header = FALSE, sep="|", colClasses=c("integer","character","numeric")) 
# import csv file   导入csvn 文件
myData <- read.csv("c:/myInputData.csv", header=True)  
write.csv(rDataFrame, "c:/output.csv")  # export  

cars_data <- cars
a <- 10
b <- 20
ls()              # list objects in global env  # 查询所有的之前的变量
rm(a)             # delete the object 'a'  删除变量
rm(list = ls())   # caution: delete all objects in .GlobalEnv 
gc()              # free system memory  清理内存中的垃圾


#lecture 5  第五节课

#1.Rstudio左上角 connection 用于连接Spark,mysql,数据库
#调用dplyr包
library(dplyr)
#两个冒号就可以查询这个包 包含的函数操作
dplyr::
require(caret)
install.packages('caret')
require(caret)
caret:: 

#创建向量 c 
xx <- c(1,2,3)
#列表 list  可以将不同的属性元素进行整合
c <- list(a=c(1,2,3,4),b = c('xiaming','hfjfh','love'),c = c())
c
c[1]            #list c 的第一个vector向量
c[[1]]          #list c 的第一个vector里面的第一个元素
class(c[[1]])

getwd()         # gets the working directory 查询工作路径
setwd(dirname)  # set the working directory to dir name 更改工作路径
ls()            # list objects in global env  # 查询所有的之前的变量
gc()            # free system memory  清理内存中的垃圾

vec = numeric(100)
seq(1, 10)

vec1 <- c(10, 20, 15, 40)           # numeric vector
vec2 <- c("a", "b", "c", NA)        # character vector
vec3 <- c(TRUE, FALSE, TRUE, TRUE)  # logical vector
# factor with 4 levels   
vec4 <- gl(4, 1, 4, label = c("l1", "l2", "l3", "l4")) 
vec5 <- factor(x=c(1,2,3),levels=c(1,2,3,4)) #levels 有多少个层级

length(vec1)  # 4
print(vec1[1])  # 10
print(vec1[1:3])  # 10, 20, 15
vec1[1]    #第一个元素
vec1[2]    #第二个元素
vec1[1:3]  #第一个到第三个
vec1[-1]   #去掉第一个

#Here is how to initialize a numeric vector: 如何初始化数值向量
numericVector <- numeric(100) # length 100 elements  numeric(length) 长度为100
vec = numeric(100) #创建一个空的 numeric 长度为100 可以对每个位置进行赋值
vec
#进行赋值vector的第一个值赋值为 56
vec[1]=56
vec
vec[4] = 112
vec
#subsetting
logic1 <- vec1 < 15  # create a logical vector, TRUE if value < 15
logic1
vec1[logic1]         # elements in TRUE positions will be included in subset
vec1[1:2]            # returns elements in 1 & 2 positions.
vec1[c(1,3)]         # returns elements in 1 & 3 positions
vec1[-1]             # returns all elements except in position 1.

#sort 排序  直接使用sort
sort(vec1)  # ascending sort 默认升序排序
sort(vec1, decreasing = TRUE)  # Descending sort  降序排序

#Sorting can also be achieved using the order() function which returns the 
#indices of elements in ascending order. 
#排序也可以使用order（）函数实现，该函数以升序返回元素的索引。
vec1 <- c(10, 20, 15, 40) 
vec1[order(vec1)]  # ascending sort
order(vec1)        # 显示排序后index 值
order()            # 升序
rev()              #降序
vec1[rev(order(vec1))]  # descending sort  降序

# seq() and rep() functions 
seq(1, 10, by = 2)  # diff between adj elements is 2 间隔2
seq(1, 10, length=25)  # length of the vector is 25  长度为25
#重复
rep(1, 5)  # repeat 1, five times.
rep(1:3, 5)  # repeat 1:3, 5 times  1到3重复5次
rep(1:3, each=5)  # repeat 1 to 3, each 5 times.

#处理缺失值 使用is.na（）函数来处理缺失值
vec2 <- c("a", "b", "c", NA)  # character vector
is.na(vec2)                   # missing TRUE 判断是否是 na
!is.na(vec2)                  # missing FALSE 
vec2[!is.na(vec2)]  # return non missing values from vec2  抽取数值 

#Sampling 随机抽样
set.seed(100)  # optional. set it to get same random samples.  随机抽样 可选的。 
#将其设置为获得相同的随机样本。 保证每次的随机数是一样的
# 这里是第100组的随机数
sample(vec1)   # sample all elements randomly  这里  vec1 是抽取的范围
sample(vec1, 3)  # sample 3 elem without replacement
sample(vec1, 10, replace=T)  # sample with replacement  replace=T 允许出现重复

#Data Frames 表格形式的数据
data.frame(colom1,colom2,colom3....)
#原始数据 4个向量
vec1 <- c(10, 20, 15, 40)  # numeric vector
vec2 <- c("a", "b", "c", NA)  # character vector
vec3 <- c(TRUE, FALSE, TRUE, TRUE)  # logical vector
vec4 <- gl(4, 1, 4, label = c("l1", "l2", "l3", "l4"))

myDf1 <- data.frame(vec1, vec2)  # make data frame with 2 columns  创建表格   data.frame()
myDf2 <- data.frame(vec1, vec3, vec4)
myDf3 <- data.frame(vec1, vec2, vec3)
myDf1


library(datasets)      # initialize 调用datasets package
library(help=datasets) # display the datasets
airquality             # datasets package 带的一个数据
class(airquality)      #查看属性
str(airquality)        # structure  查看表格结构
summary(airquality)    # summary of airquality  对每个数字格式的列计算总和
head(airquality)       # view the first 6 obs  查看前多少行，比如前10行
head(airquality,10)
fix(airquality)        # view spreadsheet like grid
rownames(airquality)   # row names  打印行 的名字
colnames(airquality)   # columns names   打印列的名字
nrow(airquality)       # number of rows  统计行的数量
ncol(airquality)       # number of columns  统计列的数量
x = c(1:10)

#Append data frames with cbind and rbind 表格结合
cbind(myDf1, myDf2)  # columns append DFs with same no. rows   表格结合  增加列数 最少要有一个相同的列名
rbind(myDf1, myDf1)  # row append DFs with same no. columns    表格结合  增加行数 所有的列要相同
rbind(myDf2, myDf3)

#Subset Data frame with number indices, subset() and which() methods
myDf1$vec1  # vec1 column          单独调出第一列
myDf1[, 1]  # df[row.num, col.num] 单独调出第一列
myDf1[1:3, 1] # df[row.num, col.num] 单独调出第一到三行 第一列
myDf1[, c(1,2)]  # columns 1 and 2 调出第一列和第二列
myDf1[c(1:5), c(2)]  # first 5 rows in column 2

#subset() 对行进行限制
subset(airquality, Day == 1, select = -Temp)  # select Day=1 and exclude 'Temp' 对行进行限制-Temp 删除Temp 这一列
#相应的mysql 语句是
#select -temp
#from airquality
#where Day = 1

airquality[which(airquality$Day==1), -c(4)]  # same as above  which 函数  

#抽样
#Sampling your data into training(data on which models are built) and test(known data on 
#which models are tested) is a common activity. Lets see how this can be done by creating 
#a randomized 70:30 training and test sample from airquality. 
#将您的数据采样到训练（建立模型的数据）和测试（已知测试模型的数据）中是很常见的活动。 
#让我们看看如何通过从空气质量中创建一个随机的70:30训练和测试样本来做到这一点。
set.seed(100)
trainIndex <- sample(c(1:nrow(airquality)), size=nrow(airquality)*0.7, replace=F)  # get test sample indices  70% 的样本
airquality[trainIndex, ]  # training data 作为建模的使用的数据
airquality[-trainIndex, ]  # test data 作为测试数据       - 的意思是把抽到的行去掉  

#merge()
#Merging Dataframes 合并数据 表格的连接
merge(myDf1, myDf2, by="vec1")  # merge by 'vec1'  表格的合并 连接

#data.frame() 生成表格   sample() 随机抽样
set.seed(100)
df1 = data.frame(StudentId = c(1:10), Subject = sample(c("Math", "Science", "Arts"), 10, replace=T))
df2 = data.frame(StudentNum = c(2, 4, 6, 12), Sport = sample(c("Football", "Tennis", "Chess"), 4, replace=T))
df1
df2
# 表连接 right join example  表连接   F 和 T 表示不同的连接
df_merge <- merge(df1, df2, by.x = "StudentId", by.y = 'StudentNum', all.x = F, all.y = T) 
#left join
df_merge <- merge(df1, df2, by.x = "StudentId", by.y = 'StudentNum', all.x = T, all.y = F) 

#The paste function
paste("a", "b")                           # "a b" paste 默认两个字符之间有一个空格
paste0("a", "b")                          # concatenate without space, "ab"   paste0 中间没有空格
paste("a", "b", sep="")                   # same as paste0
paste(c(1:4), c(5:8), sep="")             # "15" "26" "37" "48"
paste(c(1:4), c(5:8), sep="", collapse="")# "15263748"
paste0(c("var"), c(1:5))                  # "var1" "var2" "var3" "var4" "var5"
paste0(c("var", "pred"), c(1:3))          # "var1" "pred2" "var3"
paste0(c("var", "pred"), rep(1:3, each=2))# "var1" "pred1" "var2" "pred2" "var3" "pred3


#How To Make Contingency Tables 如何制作列联表
#Contingency tables gets you a count summary of a vector or 2 dimensional data. 
#Let see how to get the count table for a vector. 
#列联表可以为您提供向量或二维数据的计数摘要。 让我们看看如何获取向量的计数表。 
#查每个组合有多少个
table(cars)
names(iris)
table(iris$Sepal.Length[c(1:20)], iris$Sepal.Width[c(1:20)])  # 每一列选前20行  查看 长 宽 组合的个数 

#List
myList <- list(vec1, vec2, vec3, vec4)
myList
myList[1]
class(myList)
myList[[1]][1]   #选择第一个 vector 里面的第一个值


#If-Else
if(checkConditionIfTrue) {
  ....statements..
  ....statements..
} else {   # place the 'else' in same line as '}'
  ....statements..
  ....statements..
} 

#Practise - assing x to 10. if x > 5, print "Higher than 5"; if x <5 print "Lower than 5"
x = 10
if (x>5){
  print('Higher than 5')
}else if(x<5){
  print('Lower than 5')
}else{
  print('=5')
}
#change
#For-Loop  for 循环
for (x in 1:10){
  if (x > 5){
    print("Higher than 5")
  }else if (x < 5){
    print('Lower than 5')
  }else{
    print("x = 5")
  }
}

#apply function
#apply(): Apply FUN through a data frame or matrix by rows or columns. 对所有的行进行相同的操作
myData <- matrix(seq(1,16), 4, 4)  # make a matrix  seq(1,16)从1-16内随机抽取数字  4行  4列
myData
myData <- matrix(seq(1,16), 4, 4，byrow=T)  # make a matrix  seq(1,16)从1-16内随机抽取数字  4行  4列
myData
apply(myData, 1, FUN=min)  # apply 'min' by rows  1 表示 行的 意思  每行当中最小的数字
apply(myData, 2, FUN=min)  # apply 'min' by columns   2  代表列     每列当中最小的数字
apply(data.frame(1:5), 1, FUN=function(x) {x^2})  # 对所有的行应用了一个function  square of 1,2,3,4,5

#apply()  可以指定行还是列
#lapply() 返回一个list 
#sapply() 返回一个向量
#vapply(): Similar to sapply() but faster
sapply(airquality, class)  # return classes of each column in 'airquality' 对每一列应用一个函数

#function 的写法用法
myfunc <- function(x){
  x^2
}
myfunc(10)
apply(data.frame(1:5), 1, FUN=myfunc)

x <- list(a = 1, b = 1:3, c = 10:100)  # make a list
vapply(x, FUN = length, FUN.VALUE = 0L)  # FUN.VALUE defines a sample format of output