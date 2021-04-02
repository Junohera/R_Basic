# for 문은 구현이나 코딩은 이해하기 쉽지만 apply 또는
# if else 보다 비교적 속도가 느립니다
# apply 와 ifelse가 코드도 간결하고 빠른 연산이 가능합니다

# ifelse : if 문의 간결한 형태이며, 문법도 유사합니다
df = data.frame(aa = 1:5, bb=letters[1:5])
df
df[, 'new'] = ifelse(test = df$aa != 1, yes = 'yes', no = 'no')
df
colnames(df)[3] = 'new1'
df
df[, 'new2'] = ifelse(df$aa != 3, 'yes', 'no')
df

for (n in 1:nrow(df)) {
    if (df[n, 'aa'] == 5) {
        df[n, 'new3'] = 'yes'
    } else {
        df[n, 'new3'] = 'no'
    }
}
df

# df[, 'new2'] = ifelse(df$aa != 3, 'yes', ifelse())


###############################################################################
############# for문 안에 function과 list를 ifelse중첩문으로 변경경 ############
###############################################################################

# 파일을 읽어와서, 앞선 예제에서 계산한 경도와 위도값을 ifelse로 계산합니다.

library('ggplot2')

# 1.
marathon = read.csv('./R_Script/resource/marathon_merge[2015~2017].csv')

marathon[, "Long"] =
    ifelse(marathon$X40K < 7200, -71.08,
           ifelse(marathon$X35K < 7200, -71.12,
                  ifelse(marathon$X30K < 7200, -71.21,
                         ifelse(marathon$X25K < 7200, -71.25,
                                ifelse(marathon$X20K < 7200, -71.28,
                                       ifelse(marathon$X15K < 7200, -71.36,
                                              ifelse(marathon$X10K < 7200, -71.42, -71.47)))))))

marathon[, "Lat"] =
    ifelse(marathon$X40K < 7200, 42.35, 
           ifelse(marathon$X35K < 7200, 42.35, 
                  ifelse(marathon$X30K < 7200, 42.34, 
                         ifelse(marathon$X25K < 7200, 42.32, 
                                ifelse(marathon$X20K < 7200, 42.29, 
                                       ifelse(marathon$X15K < 7200, 42.28, 
                                              ifelse(marathon$X10K < 7200, 42.27, 42.24)))))))

tail(marathon)

# marathon 데이터에서 Lat + Long(세트표시) 컬럼을 기준으로
# Official.Time 컬럼의 length(길이, 갯수)를 계산합니다.
# python의 groupby와 유사
marathon_agg = aggregate(Official.Time~Lat+Long, marathon, length)
marathon_agg

marathonL = marathon[, c('Lat', 'Long')]
k = table(marathonL)
k

p = data.frame(
    Lat = c(
        42.27
        , 42.28
        , 42.29
        , 42.32
        , 42.34
        , 42.35
        , 42.35
    )
    , Long = c(
        -71.42
        , -71.36
        , -71.28
        , -71.25
        , -71.12
        , -71.12
        , -71.08
    )
    , cnt = c(
        135
        , 12161
        , 40653
        , 23870
        , 2579
        , 164
        , 76
    )
    , stringsAsFactors = FALSE
)
p

ggplot(
    data = p
    , aes(
        x = Lat
        , y = Long
        , color = cnt
    )
) +
    geom_point(
        size = sqrt(p$cnt) / 8
        , alpha = 0.5
    ) +
    annotate(
        geom = 'text'
        , label = p$cnt
        , size = 5
        , x = p$Lat
        , y = p$Long
    ) +
    labs(
        title = '2시간 경과 후 구간별 인원수'
        , color = '인원수'
    ) +
    theme(
        axis.title = element_text(size = 15)
        , plot.title = element_text(size = 35, hjust = 0.5)
        , axis.text = element_text(size = 15)
        , legend.title = element_text(size = 15)
        , legend.text = element_text(size = 15)
    ) +
    theme_minimal()


###############################################################################
####################### 기존의 반복문을 apply함수로 대체 ######################
###############################################################################

data(iris)
df = iris[1:10, 1:4]
df
apply(X = df, MARGIN = 1, FUN = 'sum') # 각 행들의 합계
apply(X = df, MARGIN = 2, FUN = 'sum') # 각 컬럼들의 합계

# MARGIN 값 2를 설정한 결과와 동일한 구문
sapply(df, 'sum')
sapply(df, 'class')


data('CO2')
head(CO2)
df = CO2[, 4:5]
df[, 'sum'] = apply(X = df, MARGIN = 1, FUN = 'sum')
df[, 'mean'] = apply(X = df, MARGIN = 1, FUN = 'mean')
head(df)
