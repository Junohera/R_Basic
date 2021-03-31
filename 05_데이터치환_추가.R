aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = "#"
    , stringsAsFactors = FALSE
)

# 수정
aa[1, ] = 1                 # 1행을 모두 1로
aa[1,]
aa[c(1, 3, 6), ] = 9999     # 1, 3, 6행을 모두 9999
aa[3,]

# 추가
aa[, 6] = '안녕'            # 컬럼갯수보다 큰 인덱싱은 새로 컬럼생성
aa[, ncol(aa) + 1] = 'hi'   # 컬럼개수 + 1로 컬럼 생성
aa[, 'good'] = 'morning'    # 없는 컬럼이 지목되면 새로 컬럼을 생성

# 컬럼 이름들에 컬럼명을 추가하거나 치환
# 있으면 수정, 없으면 추가
colnames(aa)[6] = "col_6"
colnames(aa)[7] = "col_7"
colnames(aa)[7:8] = c("col_7_1", "col_8")
head(aa, 1)