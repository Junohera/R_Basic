for (num in 1:5) {
    print(num)
}

for (num in c(1, 3, 5, 7, 9)) {
    print(num)
}

for (num in c(5, 4, 3, 2, 1)) {
    print(num)
}

for (ch in letters[1:5]) {
    print(ch)
}


# new 라는 컬럼을 새로 생성하고 각 행번호의 제곱값을 입력
    df = data.frame(aa = letters[1:4], bb = 1:4)
    df
    
    for (num in 1:4) {
        df[num, "new"] = num^2
    }
    df
    
    for (num in 1:nrow(df)) {
        df[num, "new2"] = num^2
    }
    df
    
# 조건문
    n = 4
    if (n == 4) {
        print("asfdfg")
    }
    
    if (n == 4) {
        print('n == 4')
    } else {
        print('n != 4')
    }
    
    if (n >= 0) {
        print('양수')
    } else if (n < 0) {
        print('음수')
    } else {
        print('0')
    }
    
    # 조건에 의한 필터링
    df = data.frame(aa = letters[1:10], bb = 1:10)
    df
    
        # 1. bb컬럼의 값이 5보다 큰 행들
            df[df$bb >= 5, ]
        # 2. aa컬럼의 값이 'b'와 같은 행들
            df[df$aa == 'b', ]
        # 3. bb가 3보다 크고, 8보다 작은 행들들
            df[df$bb >= 3 & df$bb <= 8, ]

        