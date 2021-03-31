## 파일을 읽어 행, 열을 파악하고 구조를 출력
# 1. 대상 파일을 읽어 변수에 저장 (target : marathon_results_2017.csv)
# 2. 행, 열을 파악하고 구조를 출력
#     1. nrow
#     1. ncol
#     1. dim
#     1. summary
#     1. colnames
# 3. Bib, x, x.1, Citizen, Proj.Time 열을 제외한 나머지 열을 marathon_2017_clean 변수에 저장
# 4. 모든 값이 '2017'로 저장되는 Year컬럼을 추가
# 5. 최종 기록(Official Time)을 초단위로 모두 변환하여 저장
# 6. 참가자의 나이가 60세 이상인 여부를 Senior 컬럼에 추가


# 1. 
marathon = read.csv("./R_Script/resource/marathon_results_2017.csv")
head(marathon)

# 2.
nrow(marathon)
ncol(marathon)
dim(marathon)
summary(marathon)
colnames(marathon)

# 3. Bib, x, x.1, Citizen, Proj.Time 제외
    # 1, 2, 9, 10, 21
marathon_2017_clean = marathon[ , c(3:8, 11:20, 22:25)]

ncol(marathon_2017_clean)

# 4.
marathon_2017_clean[, 'Year'] = 2017
head(marathon_2017_clean)

# 5.
library('splitstackshape')

marathon_2017_clean[, 'Official.Time']

splitOfficialTime = cSplit(marathon_2017_clean, splitCols='Official.Time', sep=':')[, c('Official.Time_1', 'Official.Time_2', 'Official.Time_3')]
splitOfficialTimeToCaracter = as.data.frame(splitOfficialTime)
marathon_2017_clean[, 'Final_Second'] = 
    (splitOfficialTime[, 'Official.Time_1'] * 60 * 60) +
    (splitOfficialTime[, 'Official.Time_2'] * 60) +
    (splitOfficialTime[, 'Official.Time_3'])


marathon_2017_clean[, 'Final_Second2'] <- (
    (
        as.integer(splitOfficialTimeToCaracter[, 'Official.Time_1'])
        * 60 * 60
    ) +
    (
        as.integer(splitOfficialTimeToCaracter[, 'Official.Time_2'])
        * 60
    ) +
    (
        as.integer(splitOfficialTimeToCaracter[, 'Official.Time_3'])
    )
)
head(marathon_2017_clean, 3)
     
# 6.
marathon_2017_clean[, 'Senior'] = marathon_2017_clean[, 'Age'] >= 60
head(marathon_2017_clean, 3)

# 7.
table(marathon_2017_clean$Senior)