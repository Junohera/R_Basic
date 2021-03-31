# comment
getwd()
a = 123
b <- 123.45
"abcdefg" -> c
d <- TRUE
a = c(1, 2, 3, 4, 5)
a
b = c(123, "asdf", 345)
b
a = data.frame(aa=c(1, 2, 3), bb=c("hi", "hello", "good morning"))

practice1 = data.frame(
  num=c(1, 2, 3, 4)
  , name=c('홍길동', '박지성', '박찬호', '박세리')
  , kor=c(78, 78, 87, 78)
  , eng=c(59, 98, 67, 88)
  , mat=c(76, 87, 76, 78)
)
practice1
  

a = matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2)
b = matrix(c(1, 2, 3, 4, 5, 6), nrow=2, ncol=3)
c = matrix(c(1, 2, 3, 4, 5), nrow=3, ncol=2)
a
b
c


a = list(
  aa=c(1, 2, 3)
  , bb=data.frame(cc=c('a','b'), cc = c('c', 'd'))
)
a


# 리스트와 벡터의 차이점
a = c(1, 2, 3, c(1, 2, 3), 4)
a
a[1]
a[4]
a[5]
aa = list(a = c(1, 2, 3), b= c(4, 5, 6))
aa[1]
aa$a[3]
