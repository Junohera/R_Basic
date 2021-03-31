
### R 프로그램의 주석처리 #
```R
# comment
```

### 현재 작업 디렉토리(폴더)를 표시
```R
getwd()
```

### 기본 변수
```R
a = 123
```

### 할당문

```R
b <- 123.45
```

```R
"abcdefg" -> c
```
> 문자열은 ', " 구분없음

### boolean
```R
d <- TRUE
```
> 대문자로 표기

### 변수
- 변수이름만 놓고 실행시, 해당 변수의 값이 출력
- 타입이 없으므로, 할당되는 값에 따라 자료형이 결정
```R
a
```
--- 
### Vector
- 리스트와 비슷한 형태의 자료형
- c(${elements})
```R
a = c(1, 2, 3, 4, 5)
```
- 벡터 할당시 __숫자, 문자가 혼합일 경우 모두 문자__ 취급
```R
b = c(123, "asdf", 345)
```
--- 
### DataFrame
- 벡터데이터를 필요한 열의 갯수만큼 넣어 구성
- 벡터데이터를 담은 변수의 이름은 열제목
- 각 벡터데이터의 길이가 다르면 에러 발생
```R
a = data.frame(aa = c(1, 2, 3), bb = c("hi", "hello", "good morning")
a
# data.frame(aa=c(1, 2, 3), bb = c("hi", "hello")) ERROR
```

#### 성적표 dataframe화
| num | name | kor | eng | mat |
|:---|:---:|---:|---:|---:|
|1|홍길동|78|59|76|
|2|박지성|78|98|87|
|3|박찬호|87|67|76|
|4|박세리|78|88|78|

```R
practice1 = data.frame(
  num=c(1, 2, 3, 4)
  , name=c('홍길동', '박지성', '박찬호', '박세리')
  , kor=c(78, 78, 87, 78)
  , eng=c(59, 98, 67, 88)
  , mat=c(76, 87, 76, 78)
)
```
--- 

### Matrix(행렬)

```R
a = matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2)
b = matrix(c(1, 2, 3, 4, 5, 6), nrow=2, ncol=3)
c = matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=2)
```
> R 프로그램의 행렬 구성시 원소수와 행, 열수가 맞지않을경우, 에러는 없고 경고메시지가 출력
#### ⚠️ __부족한 공간을 0번째원소부터 순환하며 값을 채움.__

--- 

### List
```R
a = list(
    aa=c(1, 2, 3)
    , bb=data.frame(cc=c('a','b'))
    , cc = c('c', 'd')
)
```

#### __리스트와 벡터의 차이점__

```R
a = c(1, 2, 3, c(1, 2, 3), 4)
a
a[1] # 1
a[4] # 1
a[5] # 2
aa = list(a = c(1, 2, 3), b= c(4, 5, 6))
aa[1]
aa$a[3]
```
> 인덱스 0이 아닌 1부터

# operator

### 산술 연산
```R
30 + 50
30 - 50
30 * 50
30 / 50

10 %% 3 # 나머지
10 %/% 3 # 몫
25^2 # 거듭
25**2 # 거듭
```

1. 나머지
	1. %%
3. 몫
	1. %/%
5. 거듭
	1. ^
	2. **

```R
2^3^2 # 2의 9승(<- 3의 2승)
```

### 관계(비교)
```R
n>20
n<20
n>=20
n<=10
n==10
n!=20
```

### : 숫자 생성
```R
1:5
1.5:5
1.5:10
1.5:1.5
1:5 + 10
```

### seq()
```R
seq(from=1, to=10)
seq(from=1, to=10, by=0.5)
seq(from=1, to=10, by=1.2)
seq(from=1, to=10, length.out=8) # 1부터 10까지 8개로 균등 증가값 생성
```

### rep()
```R
rep(rep(1:3, 5))
rep(1:3, times=5)
rep(1:3, each=5)
rep('안녕하세요', 5)
```

### letter(상수형 변수)
- 알파벳을 벡터 데이터로 갖고있음.
```R
letters
LETTERS
```

### pi
```R
pi

# 삼각함수
sin(pi/3)
cos(pi/3)
tan(pi/3)
```


### abs
```R
abs(-3)
abs(3)
```

### round
```R
n = 1728.2839
round(n) 		# 첫째자리 반올림
round(n, 3) 	# 네번째 자리 반올림하여 세번째자리까지
round(n, 2) 	# 세번째 자리 반올림하여 두번째자리까지
round(n, 1) 	# 두번째 자리 반올림하여 첫번째자리까지
round(n, -1) 	# 일의자리 반올림 십의 자리까지
round(n, -2) 	# 십의자리 반올림 백의 자리까지
round(n, -3) 	# 백의자리 반올림 천의 자리까지
```

### ceiling & floor
```R
n = 1728.2839
floor(n*10)/10 			# 둘째자리에서 버림
ceiling(n/100) * 100 	# 십의자리에서 올림
```

### ! factorial
```R
factorial(4)
factorial(6)
```

```R
read.csv("파일명")
read.delim("파일명", sep=",")
read.table("파일명", sep=",")
```
## tsv
```R
read.table("파일명", sep="\t")
```
---
## another
```R
read.delim("파일명", sep="${특정구분자}")
```
---
### stringsAsFactors
- stringsAsFactors : 텍스트로 읽어오는 데이터는 연속값인지 이산값인지 설정 여부
- '1', '3', '5', '7'의 데이터는 이산값이냐 연속값이냐에 따라 차트에 표기되는 모양이 달라집니다.(연속값은 선형, 이산값은 막대형)
- 서로 독립적으로 사용하는지의 여부
```R
aa = read.delim("./R_Script/resource/AWS_sample.txt"
    , sep="#"
    , stringsAsFactors = FALSE
)
```
---
## file.choose()
- 불러올 파일이 작업 폴더에 없고, 다른 폴더에 있는 경우
```R
bb = read.csv(file.choose(), header=TRUE)
```
---
## head
```R
head(aa)
head(aa, 3)
head(aa, n=3)
```

## tail
```R
tail(aa)
tail(aa, 3)
tail(aa, n=3)
```
---
## str
- structure의 약자로서 구조를 나타냄(__str__ 과 상관없음)
- python에서 info와 동일
```R
str(aa)
```

## summary
- python의 describe와 동일
```R
summary(aa)
```
---
## nrow
```R
nrow(aa) # 행
```

## ncol
```R
ncol(aa) # 열
```

## dim
- .shape
```R
dim(aa) # 행, 열
```
---
## colnames
```R
colnames(aa)
```

### load data
```R
aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = "#"
    , stringsAsFactors = FALSE
)
```
---
## 열추출
### 1. $
- 데이터 프레임을 대상으로 한 여러가지형태의 데이터 필터링 $를 활용한 하위구조 추출
```R
id = aa$AWS_ID # AWS_ID 열 추출
id
wd = aa$Wind # Wind 열 추출 
wd
```
### 2. Indexing
```R
aa[,1]
aa[,1:2]
aa[,"Wind"]
aa[,c("AWS_ID", "Wind")]
```
---
## 행추출
### 1. Indexing
- [], c
- 벡터 연산을 사용한 하위 구조 데이터 추출
- 파이썬의 인덱싱과 같은 필터링
```R
aa[3,]                      # 3행
aa[15,]                     # 15행
aa[1:6,]                    # 1~6행
aa[c(5:10, 15:11, 2),]      # 5~10, 15~11, 2 행
```
---
## 행, 열 추출
```R
aa[1, 3]                    # 1행 3열
aa[1:3, 2:3]                # 1~3행, 2~3열
aa[1, 2:3]                  # 1행, 2~3열
aa[1:3, 2]                  # 1~3행, 2열
aa[c(4, 1, 2), c(4, 2, 1)]  # 4,1,2행, 4,2,1열
```


### load data
```R
aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = "#"
    , stringsAsFactors = FALSE
)
```
---

## 수정
```R
aa[1, ] = 1                 # 1행을 모두 1로
aa[c(1, 3, 6), ] = 9999     # 1, 3, 6행을 모두 9999
```

## 추가
```R
aa[, 6] = '안녕'            # 컬럼갯수보다 큰 인덱싱은 새로 컬럼생성
aa[, ncol(aa) + 1] = 'hi'   # 컬럼개수 + 1로 컬럼 생성
aa[, 'good'] = 'morning'    # 없는 컬럼이 지목되면 새로 컬럼을 생성

# 컬럼 이름들에 컬럼명을 추가하거나 치환
# 있으면 수정, 없으면 추가
colnames(aa)[6] = "col_6"
colnames(aa)[7] = "col_7"
colnames(aa)[7:8] = c("col_7_1", "col_8")
head(aa, 1)
```

### load data
```R
aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = "#"
    , stringsAsFactors = FALSE
)

aaa = aa[1:3, 2:4]
bbb = aa[9:11, 2:4]
```
## 병합
### rbind - __row__
- 병합하고자 하는 데이터를 제한없이 붙여 병합
- 행단위의 병합은 __열개수가 일치해야 가능__
```R
rbind(aaa, bbb)
rbind(aaa, bbb, aaa, bbb, aaa, bbb)
```

### cbind - __column__
- 열단위의 병합은 __행개수가 일치해야 가능__
```R
cbind(aaa, bbb)
cbind(aaa, bbb, aaa)
```

### error
```R
# 위에서 말했듯 행,열 서로 맞지않으면 에러

aaa = aa[1:5, 2:4]
bbb = aa[9:11, 2:4]
# cbind(aaa, bbb)

aaa = aa[1:3, 1:5]
bbb = aa[9:11, 2:4]
# rbind(aaa, bbb)
```

## table
- python의 value_counts
```R
table(aa$AWS_ID)
```