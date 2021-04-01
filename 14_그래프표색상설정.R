bar_df = data.frame(
    obs=1:10
    , var = rep(c('A', 'B','C'), length.out = 10)
    , var_1 = rep(c('A','B','C'), 10)
    , value = sample(1:100, size=10)
    , stringsAsFactors = FALSE
)

bar_df
library('ggplot2')

# 평범한 막대 그래프
    ggplot(data = bar_df, aes(x = obs, y = value)) + geom_bar(stat = 'identity')
    
    # 색상 적용 1
    ggplot(data = bar_df, aes(x = obs, y = value, color = value)) + geom_bar(stat = 'identity')
    
    # 색상 적용 2
    ggplot(data = bar_df, aes(x = obs, y = value, fill = value)) + geom_bar(stat = 'identity')
    
    # 색상 적용 3
    ggplot(data = bar_df, aes(x = obs, y = value, fill = as.factor(value))) + geom_bar(stat = 'identity')
    
    # 색상 적용 4
    ggplot(data = bar_df, aes(x = as.factor(obs), y = value, fill = as.factor(value))) + geom_bar(stat = 'identity')
    
    # position
    ggplot(data = bar_df, aes(x = as.factor(obs), y = value, fill = as.factor(value))) + geom_bar(stat = 'identity', position = 'stack')
    ggplot(data = bar_df, aes(x = var_1, y = value, fill = as.factor(value))) + geom_bar(stat = 'identity', position = 'dodge')
    
    # barplot의 또다른 예 ( geom_bar -> geom_col )
    ggplot(data = bar_df, aes(x=obs, y=value)) + geom_col()
    ggplot(data = bar_df, aes(x=obs, y=value, fill = value)) + geom_col()
    ggplot(data = bar_df, aes(x=obs, y=value, fill = as.factor(value))) + geom_col(size=10)
    
    # 추가 옵션 : 축 눈금 값들의 사이즈 조정
    ggplot(data = bar_df, aes(x=obs, y=value, fill = as.factor(value))) + geom_col(size=15) + theme(axis.text = element_text(size=15))
    ggplot(data = bar_df, aes(x=var, y=value, fill = as.factor(value))) + geom_col(size=15, position = 'dodge') + theme(axis.text = element_text(size=15))


# 막대 그래프의 색상 설정 1
    color_df = data.frame(
        obs = 1:10
        , var = rep(c('A','B','C'), length.out = 10)
        , value = sample(1:100, size=10)
        , stringsAsFactors = FALSE
    )
    color_df
    
    # 컬럼이름이 아닌 색상이름을 지정하면 아래와 같이 지정되지 않은 색이 표시됩니다.
    ggplot(data = color_df, aes(x = var, y = value, fill = 'blue')) + geom_bar(stat = 'identity', position = 'stack')
    
    # aes 밖에 색상설정은 적용되지않음.
    ggplot(data = color_df, aes(x = var, y = value), fill = 'blue') + geom_bar(stat = 'identity', position = 'stack')
    
    # geom_bar안에 fill값을 지정해야 색이 적용
    ggplot(data = color_df, aes(x = var, y = value)) + geom_bar(stat = 'identity', position = 'stack', fill = 'blue')
    
    # + alpha
    ggplot(data = color_df, aes(x = var, y = value)) + geom_bar(stat = 'identity', position = 'stack', fill = 'blue', alpha = 0.3)

# 막대 그래프의 색상 설정 2
    ggplot(data = color_df, aes(x = obs, y = value, color = value)) + geom_line(size=3)
    
    ggplot(data = color_df, aes(x = obs, y = value, color = value)) + geom_line(size=3, color = 'blue')

    
    # var 값으로 그룹을 설정 & 그룹에 컬러 설정
        
        # 회색 톤
        ggplot(data = color_df, aes(x = as.factor(obs), y = value, group = var, color = var)) + geom_line(size=3) + scale_color_grey(start = 0.2, end = 0.8)

        # R프로그램이 제공하는 팔레트 번호로 설정 (1 ~ 18번까지 사용)
        ggplot(data = color_df, aes(x = obs, y = value, group = var, color = var)) + geom_line(size=3) + scale_color_brewer(palette=15)
        
        # custom
        ggplot(data = color_df, aes(x = obs, y = value, group = var, color = var)) + 
        geom_line(size=3) + 
        scale_color_manual(values = c('A'='red', 'B'='blue', 'C'='green'))

               