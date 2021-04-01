bar_df = data.frame(
    obs = 1:10
    , var = rep(c('A','B','C'), length.out = 10)
    , value = sample(1:100, size=10)
    , stringsAsFactors = FALSE
)
bar_df

library('ggplot2')

ggplot(
    data = bar_df
    , aes(
        x = var
        , y = value
        , fill = value
    )
) + geom_bar(stat = 'identity', position = 'stack')

# 그래프의 여백 조절
ggplot(
    data = bar_df
    , aes(
        x = var
        , y = value
        , fill = value
    )
) + geom_bar(stat = 'identity', position = 'stack') + scale_x_discrete(expand = c(0.01, 0.01))

# 축설정 - 최대 최소값 설정
ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) + scale_x_continuous(limits = c(5, 10))


ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) + scale_y_continuous(limits = c(5, 80))

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_bar(stat = 'identity', position = 'stack') + scale_x_continuous(limits = c(5, 10))

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) + scale_y_continuous(limits = c(0, 200))

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) + scale_x_continuous(
    breaks = c(5, 10) # breaks : 눈금을 그릴 자리
    , labels = c(5, 10) # labels : 눈금에 써넣을 축값들
)

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) +
    scale_x_continuous(
        breaks = seq(0, 10, 1)
        , labels = seq(0, 10, 1)
    )

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) +
    scale_x_continuous(
        breaks = seq(0, 10, 1)
        , labels = seq(0, 10, 1)
    ) +
    scale_y_continuous(
        breaks = seq(0, 100, 10)
        , labels = seq(0, 100, 10)
    ) +
    theme(axis.text = element_text(size = 15))

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_line(size=2) +
    scale_x_continuous(
        limits = c(-5, 10)
        , breaks = 1:10
        , labels = 1:10
    ) +
    scale_y_continuous(
        limits = c(0, 200)
        , breaks = (1:5)*20
        , labels = (1:5)*20        
    ) +
    theme(axis.text = element_text(size = 15))