sample = data.frame(
    aa=c('abc_adfsdf', 'abc_kkdfsfsfs', 'ccd')
    , bb = 1:3
    , stringsAsFactors = FALSE
)
sample


sample[1,1]

# 문자의 개수 반환
nchar(sample[1,1])
nchar(sample[2,1])

# 특정 문자열의 위치 확인
which(sample[, 1] == 'ccd')

# 대소문자 변환
toupper(sample[1,1])
tolower(sample[2,1])


install.packages('splitstackshape')

library('splitstackshape')

# 데이터 프레임 대상 문자열의 분리
# sep 기준으로 aa 컬럼의 문자열들을 분리
result = cSplit(sample, splitCols='aa', sep='_')
result


paste(sample[, 1], sample[, 2]) # 중간에 공백을 삽입하여 붙임
paste0(sample[, 1], sample[, 2]) # 공백없이 붙임
paste(sample[, 1], sample[, 2], sample[, 1], sep="@@@")

substr(sample[, 1], start=1, stop=2)
substr(sample[, 1], start=1, stop=4)

as.logical("123")
as.logical("")
as.logical(123.12)
as.logical(0)
as.numeric("123")
as.character(23.45)
as.character(23)
as.integer(123.123)
as.numeric("123")
as.character(23.45)