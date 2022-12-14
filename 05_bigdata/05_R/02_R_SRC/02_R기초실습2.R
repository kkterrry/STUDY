################################
##### 2장. R Language 기초 #####
################################
#1. 도움말 기능
#1.1 도움말
iris
edit(iris)
? iris     # iris도움말 출력
help(iris) # iris도움말 출력

#1.2 검색기능
??iris
help.search('iris')

#1.3 패키지 도움말
library(help="datasets")

#1.4 함수 도움말
methods(as) #형변환 함수들
as.integer(1.25)
?as.integer

x<-pi*c(-1:1, 10)
x
as.integer(x)
example("as.integer") #예제 출력

data <- c(10,20,30)
mean(data)
?mean
example(mean)

#1.5주석
#주석
#자동완성 : Tab
R.version

#1.6 정보
iris
edit(iris)
attributes(iris)

##2. 패키지
#R내에 기본 패키지외의 패키지는 다운받음
#1. 패키지 설치
  # install.packages("패키지명")
  # 설치된 패키지를 메모리에 로드: library(패키지명)
  # 로드된 패키지 안의 데이터나 함수 사용가능
  # 패키지 언로드: detach("package: 패키지명", unload=TRUE)

dim(available.packages()) #CRAN site에 업로드된 패키지 갯수
available.packages()

install.packages("stringr") # 1. 패키지 설치
library(stringr) # 2. 메모리 로드
? str_extract # 3. 패키지 내 함수 막 사용
data <- '홍길동35이순신45김말똥12'
data
str_extract(data, '[1-9]{2}')
str_extract_all(data, '[1-9]{2}')

detach("package:stringr", unload = TRUE) # 메모리 언로드
str_extract(data, '[1-9]{2}')

iris # datasets (기본적으로 로드된 패키지)내 데이터
detach("package:datasets", unload = TRUE)
iris

##3. 변수
# 변수 할당 : <-, <<-
result <- 0 #전역변수
class(result)
add <- function(a, b){
  # result <- a+b # 지역변수
  result <<- a+b # 전역변수에 할당
  return(result)
}
add(10,20)
print(result)

#변수 목록 조회
.a <- 10 #히든변수
.a
x <- 10
y <- 10
(Z<-x+y)
ls() #히든 변수를 제외한 변수 목록 출력
?ls
ls(all.names = TRUE) #히든 변수 포함
ls.str() #변수이름과 구조를 함께 보여줌

##4. 출력
#(1) print
result
print(result)
# print("result값은 ", result)
paste()
paste("Hello", "World")
paste0("Hello", "world")
paste("Hello", "world", "R", sep=", ")
?paste

temp <- paste(c(1,2,3),c("하나","둘","셋"),sep=" 은", collapse=" / ")
temp

# 월이름은 nth
month.abb # 월이름 약자
month.name # 월이름
c(1,2,3,4,5,6,7,8,9,10,11,12)
nth <- paste(1:12, c('st','nd','rd', rep('th',9)) , sep="")
nth <- paste0(1:12, c('st','nd','rd', rep('th',9)) )
paste(month.name, nth, sep="은 ")
paste(month.name, nth, sep="은 ", collapse=" / ")

## 5. 변수 삭제 : rm()
ls(all.names = TRUE)
# 특정 변수만 삭제
rm(nth)
nth
# 일반 변수 목록의 변수들 삭제
rm(list=ls())
# 히든변수까지 다 삭제
ls(all.names = T)
rm(list=ls(all.names = TRUE))
a <- 10
.a <- 10
##### 문1. kor변수에 "한국","일본","미국"
#####      eng변수에 "Korea","Japen","USA"
#####    출력 : 한국:Korea, 일본:Japen, 미국:USA
kor <- c('한국','일본','미국') # 동일 자료형 집합 = 벡터
eng <- c('Korea','Japen','USA')
msg <- paste(kor, eng, sep=":", collapse = ", ")
msg
##### 문2. MASS::Cars93 데이터 출력해 보세요
.libPaths() # 내 시스템에 R 패키지가 설치된 폴더
Cars93 # Cars93 이 있는 패키지(MASS)는 메모리 로드 안 됨
iris   # iris가 있는 패키지(datasets)는 메모리에 로드됨

# 패키지를 install
installed.packages("MASS")
# 메모리에 패키지 로드
library("MASS")
library(MASS)
require("MASS")
require(MASS)
Cars93
edit(Cars93)
head(Cars93) # 1~6행까지만
head(Cars93, 3) # 1~3행까지만
tail(Cars93) # 끝 6행만
tail(Cars93,3) #끝 3행만만

# 패키지 메모리 언로드
detach("package:MASS", unload = TRUE)

#### 문3. 도움말
?mean     # 함수 도움말
hep(mean)
?iris     # 데이터 도움말
library(help="MASS") # 라이브러리(패키지) 도움말


































































