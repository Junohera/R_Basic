# 숫자 벡터 생성
    number = c(1:100)
    number

# sample 함수 : 대상 데이터들 중 지정된 갯수만큼 랜덤하게 선택하는 함수
    set.seed(50)
    number = sample(number, 30)
    number

# order 함수는 대상데이터들을 정렬하고 그 인덱스값으로 표시된 결과를 리턴
    order(number)

    # 오름차순
        number[order(number)]
    # 내림차순
        number[order(number, decreasing = TRUE)]
        number[order(-number)]

# sort
    # 오름차순
        sort(number)
    # 내림차순
        sort(number, decreasing=TRUE)
        
        
# min, max, mean
    min(number)
    max(number)
    mean(number)
     
# median
    
    # 홀수개의 중앙값 (중간 인덱스의 값)
        number = sample(number, 15)
        number
        median(number)
    
    # 짝수개의 중앙값 (중간 두 인덱스값들의 중간값)
        number = sample(number, 10)
        number
        median(number)
    
# unique
    a = c(1, 1, 1, 2, 3, 4, 4)
    unique(a)
    
# match
    a = c(1, 1, 1, 2, 3, 4, 4)
    b = unique(a)
    c = match(a, b)
    c
    
# tabulate
    a = c(1, 1, 1, 2, 3, 4, 4)
    p = tabulate(a)
    p
    
# 최빈값
    which.max(p) # 가장 큰 값의 위치
    
# 최빈값 함수
    mode = function(x) {
        ux = unique(x)
        ux[which.max(tabulate(match(x, ux)))]
    }
    mode(c(1, 1, 2, 3, 4, 55, 5, 5, 5, 5))
    
# 분산
    var(number)
    
# 표준편차
    sd(number)
    
# 결측치 포함여부
    mean( c(1, 2, 3, NA, 23)) # 결과 NA
    
# 결측치 삭제 후 평균계산    
    mean( c(1:3, NA, 23), na.rm = TRUE)
    mean( c(1:3, NA, 23), na.rm = T)
    
    
# 결측치가 아닌 서로다른 타입의 평균
    mean(c(1:3, '사과', 23)) # 에러
    mean(c(1:3, '사과', 23), na.rm = T) # 에러
    
    
# 결측치를 중앙값으로 대체한 후의 평균
    a = c(2, 3, NA, 5, NA, 7)
    a
    is.na(a)
    a[is.na(a)] = median(a, na.rm = TRUE)
    a
    mean(a)