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

table(aa$AWS_ID)
