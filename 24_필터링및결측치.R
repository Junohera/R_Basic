# subset 함수의 사용
data('airquality')
head(airquality)
df = airquality
subset(df, Day < 2, select = c(Ozone, Temp))
subset(df, Day == 1, select = Ozone:Wind)
head(df)


# filter 함수 사용
# install.packages('dplyr')
library('dplyr')

# filter 함수는 열의 값을 이용해서 행을 필터링하는데 주로 사용
data('airquality')
head(airquality)
df = airquality
df
filter(df, Day == 1)                        # Day가 1인
filter(df, Day %in% 1:2)                    # Day가 1 또는 2
filter(df, Day == 1 & Month == 5)           # Day가 1이면서 Month가 5
filter(df, Day == 1 | Month == 5)           # Day가 1 이거나 Month가 5
filter(df, Day == 1 & Day == 5)             # Day가 1이면서 5
filter(df, Day %in% c(1, 3, 5, 7))          # Day가 1, 3, 5, 7에 포함



# 데이터 생성
set.seed(123)
df = data.frame(
    xx = 1:200
    , yy = rnorm(
        n = 200
        , mean = 5
        , sd = 3
    )
) # 평균이 5이고 표준편차가 3인 정규분포 형태의 숫자 200개 랜덤추출
head(df)


# yy값의 하위 3개값 출력
df[order(df$yy), 'yy'][1:3]

# 상위 3개값 출력
df[order(-df$yy), 'yy'][1:3]


# 상위 하위 값의 모든 열의 값(데이터프레임 구조)를 추출
df[df$yy %in% df[order(df$yy), 'yy'][1:3], ]
df[df$yy %in% df[order(-df$yy), 'yy'][1:3], ]


# 95%이상의 데이터 추출
quantile(df$yy, probs = 0.95)
df[df$yy > quantile(df$yy, probs = 0.95), ]
df[df$yy > quantile(df$yy, probs = 0.98), ]

data('airquality')
head(airquality)
df = airquality
# 결측치 확인 - 벡터연산
df

# 모든컬럼
colnames(df)

# 모든 컬럼 결측치 행 출력력
df[is.na(df$Ozone),]
df[is.na(df$Solar.R),]
df[is.na(df$Wind),]
df[is.na(df$Temp),]
df[is.na(df$Month),]
df[is.na(df$Day),]

is.na(df$Ozone) # Ozone 결측치 내역
sum(is.na(df)) # 전체 결측치 개수

sum(is.na(df)) # 전체 결측치 개수 확인
sum(is.na(df$Ozone)) # ozone의 결측치 갯수 확인

table(is.na(df)) # 결측치 집계 테이블 생성


# Ozone 값이 결측치 아닌 것만 필터링
library('dplyr')
df3 = df %>% filter(!is.na(Ozone))
head(3)

# Ozone의 평균값
mean(df$Ozone)
# 결측치 제거 평균값
mean(df$Ozone, na.rm=T)
# 결측치를 지정 값으로 대체
df$Ozone = ifelse(
    is.na(df$Ozone)
    , mean(df$Ozone, na.rm=T)
    , df$Ozone
)
df
sum(is.na(df)) # 전체 결측치 개수 확인
