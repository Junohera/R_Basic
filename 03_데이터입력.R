# csv
read.csv("파일명")
read.delim("파일명", sep=",")
read.table("파일명", sep=",")

# tsv
read.table("파일명", sep="\t")

# another
read.delim("파일명", sep="${특정구분자}")


aa = read.delim("./R_Script/resource/AWS_sample.txt"
                , sep="#"
                , stringsAsFactors = FALSE
) # stringsAsFactors : 텍스트로 읽어오는 데이터는 연속값인지 이산값인지 설정 여부
# '1', '3', '5', '7'의 데이터는 이산값이냐 연속값이냐에 따라 차트에 표기되는 모양이 달라집니다.(연속값은 선형, 이산값은 막대형)


aa

bb = read.csv(file.choose(), header=TRUE)

head(aa)
head(aa, 3)
head(aa, n=3)

tail(aa)
tail(aa, 3)
tail(aa, n=3)

str(aa)
summary(aa)


nrow(aa)
ncol(aa)
dim(aa)

colnames(aa)
