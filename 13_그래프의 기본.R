
# 유용한 사이트
# ggplot2의 매뉴얼로 사용할 사이트
# https://ggplot2.tidyverse.org/reference

# R studio와 차트에 대한 노하우를 모아놓은 사이트
# https://rstudio.com/resources/cheatsheets

# 색상에 관한 조합 및 코드 제공 사이트
# https://color.adobe.com


aa = read.delim(
    './R_Script/resource/AWS_sample.txt'
    , sep = '#'
    , stringsAsFactors = FALSE
)
head(aa)
plot(aa$TA)

plot(1:10, 1:10)
plot(1:10, 1:10, col='red')
plot(1:10, 1:10, col='red', type='b')



# install.packages('ggplot2')
library('ggplot2')

data_point = data.frame(
    xx = 1:10
    , yy = sample(1:10, 10)
)
# sample(1:10, 10) : 1~10사이의 랜덤숫자 10개 생성
data_point

    # ggplot style 1
        ggplot(
            data = data_point
            , aes(x = xx, y = yy)
        ) + geom_point()
        # 대상 데이터 : data_point
        # x 축 : xx
        # y 축 : yy
        # geom_point() : point chart 제작
    
    # ggplot style 2
        ggplot(
            data_point
            , aes(xx, yy)
        ) + geom_point()
    
    
    # ggplot style 3
        ggplot() + geom_point(
            data = data_point
            , aes(x = xx, y = yy)
        )
        
    # ggplot style 4
        ggplot() + geom_point(
            data = data_point
            , aes(xx, yy)
        )

# ggplot graph type
    
    # line
        ggplot(
            data = data_point
            , aes(xx, yy)
        ) + geom_line()

        ggplot() + geom_line(
            data = data_point
            , aes(xx, yy)
        )
        
        
    # bar
        
        # ready
            data_bar = data.frame(
                xx = 1:10
                , yy = sample(1:3, 10, replace = T)
            ) # sample(1:3, 10, replace = T) : sample함수로 데이터 중복 허용하여 1부터 3까지의 숫자를 10개 발생
            data_bar
        
        ggplot(
            data = data_bar
            , aes(yy)
        ) + geom_bar()
        
        ggplot(
            data = data_bar
            , aes(xx, yy)
        ) + geom_bar(stat = 'identity')
        