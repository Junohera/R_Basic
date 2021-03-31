aaa = aa[1:3, 2:4]
aaa
bbb = aa[9:11, 2:4]
bbb

rbind(aaa, bbb)
rbind(aaa, bbb, aaa, bbb, aaa, bbb)

cbind(aaa, bbb)
cbind(aaa, bbb, aaa)

# 위에서 말했듯 행,열 서로 맞지않으면 에러
aaa = aa[1:5, 2:4]
bbb = aa[9:11, 2:4]
# cbind(aaa, bbb)

aaa = aa[1:3, 1:5]
bbb = aa[9:11, 2:4]
# rbind(aaa, bbb)

table(aa$AWS_ID)            # 값의 종류와 갯수 표시
table(aa$AWS_ID, aa$X.)     # 행에는 AWS_ID들이 제목으로, 열에는 X. 값들이 열의 제목으로 표시하면서 크로싱된 갯수 표시
aa[2500:3100, "X."] = '+'
table(aa$AWS_ID, aa$X.)
tail(aa)


prop.table(table(aa$AWS_ID)) # 테이블이 표시하는 값을 비율로 변환
prop.table(table(aa$AWS_ID, aa$X.))
prop.table(table(aa$AWS_ID, aa$X.))*100
round(prop.table(table(aa$AWS_ID, aa$X.))*100)
paste0(round(prop.table(table(aa$AWS_ID, aa$X.))*100, 1), '%')
