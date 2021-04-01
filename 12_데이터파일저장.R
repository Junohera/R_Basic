# read
aa = read.delim(
    "./R_Script/resource/AWS_sample.txt"
    , sep = '#'
    , stringsAsFactors = FALSE
)
head(aa, 3)

# write
write.csv(aa, './R_Script/resource/output/aws_test_1.csv')

# 행번호(인덱스) 생략
write.csv(aa, './R_Script/resource/output/aws_test_2.csv', row.names = FALSE)

# 데이터저장시 row.names = T일 때
write.csv(aa, './R_Script/resource/output/aws_test_3.csv', row.names = T)
aa = read.delim('./R_Script/resource/output/aws_test_3.csv', sep = '#', stringsAsFactors = TRUE)
head(aa, 3)