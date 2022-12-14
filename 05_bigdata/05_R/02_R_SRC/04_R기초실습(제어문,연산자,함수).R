##################################################
##### 4장. R프로그래밍(제어문, 연산자, 함수) #####
##################################################
### 1. 제어문
## (1) if문
num <- 9
if(num%%2==0){
  print(paste(num,"은 짝수입니다"))
}else{
  cat(num,"은 홀수")
}
## (2) ifelse()함수 : (num%2==0) ? "짝":"홀"
ifelse(num%%2==0, "짝수","홀수")

(nums <- c(10,9,16,17,20))
result <- ifelse(nums%%2==0,"짝수","홀수")
matrix(c(nums,result),ncol=5,byrow = TRUE,dimnames = list(c("수","홀짝"),
                                                          c("1회","2회","3회","4회","5회")))
## (3) switch()함수
switch(2, "red", "green","blue")
x <- switch(4, "red","green","blue")
x

# 사용자로부터 color값을 받아 해당 color를 출력
?readline
colorValue <- as.integer(readline(prompt = "컬러값은(red:1, green:2, blue:3) : "))
colorValue
class(colorValue)
color <- switch (colorValue,"red","green","blue")
cat('선택하신 색상은 ', color)

# 사용자로부터 점수(0~100사이의 정수)를 입력받아 학점을 출력
score <- as.integer(readline("점수(0~100)는 : "))
grade <- switch (as.integer(score/10)+1, "F","F","F","F","F","F",
                 "D","C","B","A","PERFECT")
cat('점수는',score, ' / 학점은', grade)

# 함수 - 사용자에게 점수(50~100점 사이의 정수)를 입력받아 학점을 출력
getGrade <- function(){
  score <- as.integer(readline("점수(50~100)는 : "))
  grade <- switch (as.integer(score/10)-4, "F", "D", "C", "B", "A", "Perfect")
  print(paste("점수는", score, " / 학점은", grade))
}
getGrade()

###2. 반복문(for, while, repeat)
## (1) for문
x<-c(-2,5,4,8)

for(i in x){
  cat(i, '\t')
}

# x 벡터에 짝수가 몇개 있는지 출력
count <- 0 # 짝수일때마다 증가할 count 변수
for(i in x){
  if(i%%2 ==0){
    count = count +1
  }
}
cat('짝수의 갯수는',count)

#안녕하세요 10회 반복
for(i in 1:10){
  cat(i,'안녕하세요','\n')
}

# 문. facorial 계산 함수를 작성하시오
# fact(3) 결과: 3! = 6
# fact(-3) 결과 : 음수값을 위한 팩토리얼은 존재하지 않아요
# fact(0) 결과 : 0! = 1
fact <- function(num){
  result <- 1 #누적곱 변수
  if(num<0){
    cat('음수 안됨')
  }else if(num==0){
    cat('0! = 1')
  }else{
    for(i in num:1){
      result = result * i
    }
    cat(num, '!=', result)
  }
}
fact(7)

# factorial.R 저장, 변수 다 삭제
getwd()
setwd('C:/bigdata/src/06_R')
getwd()
fact(7)
source('factorial.R') # 에러 : UTF-8로 인코딩된 한글 부분 출력
Sys.getlocale() # 내 OS의 기본 인코딩 체계 (Windows의 기본 인코딩 CP949)
source('factorial.R', encoding = 'utf-8')
fact(7)

## (2) while : 조건이 참이면 반복문 수행
i <- 1
while(i < 6){
  print(i)
  i <- i + 1
}

## (3) repeat : 반복
i <- 1
repeat{
  if(i>=6) break;
  print(i)
  i <- i+1
}

## (4) break, next(자바에서의 continue)
x <- 0
while(x<7){
  x <- x+1
  if(x==3) break;
  cat(x, '  ')
}
x <- 0
while(x<7){
  x <- x+1
  if(x==3) next;
  cat(x, '  ')
}


### 3. 연산자

## 3.1 벡터연산
x <- c(11,2,13) # 3개 짜리
y <- c(1, 12,3) # 3개 짜리
x + y
x > y
x ^ y   # 승
x %/% y # 몫

x <- c(11, 2, 13, 1, 1) # 5개짜리
y <- c(1, 12,3) # 3개 짜리
x + y
x + 1
y + x

## 3.2 논리 연산자 &, &&, |, ||
TRUE && TRUE
TRUE & TRUE
x <- c(T,T,F,F)
y <- c(T,F,T,F)
x & y # 모든 요소끼리 다 체크
x | y # 모든 요소끼리 다 체크
x && y # 첫번째 요소끼리 만 체크
x || y

## 3.3 중위연산자
5+8
'+'(5,8)
'%@%' <- function(a, b){
  return(2*a+2*b)
}

'%@%'(10, 15)
10 %@% 15

10 %in% c(10, 20, 30)

'%*%' <- function(a, b){
  return (a+b)
}
a <- matrix(1:4, ncol = 2)
b <- matrix(c(1,0,0,1), ncol = 2)
a
b
a %*% b
rm(list=ls())

# %o% : 외적
# %*% : 내적 (행렬의 곱)

a <- c('1','2','3')
b <- c('a','b','c')
outer(a, b, FUN=paste)

a <- c(1,2,3)
b <- c(10,20,30)
a %o% b

matrix.a <- matrix(1:6, nrow=3) # 3x2
matrix.b <- matrix(1:6, nrow=3) # 3x2
matrix.a %*% matrix.b # 에러
solve(matrix.a)       # 에러

### 4. 함수
pow <- function(x, y=0){
  return (x^y)
}
pow(2, 3)
pow(2)
pow(y=3, x=2)

pow1 <- function(x=0, y){
  return (x^y)
}
pow1(2, 3)
# pow1(2) 에러
pow1(y=2)
pow1(y=2, x=3)

# 명시적으로 return()을 사용할 경우 NULL이 return 
check <- function(x){
  if(x>0){
    result <- '양수'
    return (result)
  }else if(x<0){
    result <- '음수'
    return (result)
  }else{
    return ()
  }
}
(temp <- check(9))
(temp <- check(-9))
(temp <- check(0))

# 명시적으로 return함수가 없는 경우 : 마지막에 실행된 표현식의 값이 자동으로 return 됨
check <- function(x){
  if(x>0){
    result <- '양수'
  }else if(x<0){
    result <- '음수'
  }else{
    result <- '0이네'
  }
}
(temp <- check(9))
(temp <- check(-9))
(temp <- check(0))

# 가변인자함수 : 매개변수의 수가 가변인 함수
total()
total(1)
total(1,2)
total(1,2,3)
total <- function(...){
  args <- c(...)
  sum <- 0 # 누적합 변수
  for(val in args){
    sum <- sum + val
  }
  return (sum)
}
total(1,2,3,4,5,6,7,8,9)
total(3,8,100)
total()

# 재귀함수 : 함수내에서 내함수를 호출하는 함수
# fact(3) = 3*2*1
# recurse.fact(3) = 3 * recurse.fact(2)
#                 = 3 * 2 * recurse.fact(1)
# recurse.fact(n) = n * recurse.fact(n-1)
recurse.fact <- function(num){
  if(num < 0){
    cat('음수값을 위한 팩토리얼은 존재하지 않아요')
  }else if (num==0){
    return (1)
  }else{
    return (num* recurse.fact(num-1))
  }
}
temp <- recurse.fact(-1) # 3 * recurse.fact(2)
# 3 * 2 * recurse.fact(1)
# 3 * 2 * 1 * recurse.fact(0)
temp

### 5. R 환경과 유효범위
environment()
ls()
f <- function(f_x){
  g <- function(g_x){
    print('g 함수 안')
    print(environment())
    print(paste('g함수 영역에서의 변수들 :',ls()))
  }
  g(5)
  print('f 함수 안')
  print(environment())
  cat('f 함수 영역에서의 변수들 :', ls())
}
f(10)








































