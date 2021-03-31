aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = "#"
    , stringsAsFactors = FALSE
)

# 열추출

# 데이터 프레임을 대상으로 한 여러가지형태의 데이터 필터링 $를 활용한 하위구조 추출
id = aa$AWS_ID
id
wd = aa$Wind
wd

aa[,1]
aa[,1:2]
aa[,"Wind"]
aa[,c("AWS_ID", "Wind")]

# 행추출

aa[3,]                      # 3행
aa[15,]                     # 15행
aa[1:6,]                    # 1~6행
aa[c(5:10, 15:11, 2),]      # 5~10, 15~11, 2 행

# 동시 추출
aa[1, 3]                # 1행 3열
aa[1:3, 2:3]                # 1~3행, 2~3열
aa[1, 2:3]              # 1행, 2~3열
aa[1:3, 2]              # 1~3행, 2열
aa[c(4, 1, 2), c(4, 2, 1)]             # 4,1,2행, 4,2,1열