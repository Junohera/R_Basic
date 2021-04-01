library('ggplot2')

bar_df = data.frame(
    obs = 1:10
    , var = rep(
        c('A', 'B', 'C')
        , length.out = 10
    )
    , value = sample(1:100, size = 10)
    , stringsAsFactors = FALSE
)

# point 
ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_point(size = 10)

# 비어있는 point
ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_point(size = 10, shape = 1)

# 세모모양의 point
ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
    )
) + geom_point(size = 10, shape = 2)

# 데이터마다 포인트의 모양을 변경
ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
        , shape = var
    )
) +
    geom_point(size = 10) +
    scale_shape_manual(
        values = c(
            'A' = 7
            , 'B' = 8
            , 'C' = 9
        )
    )

ggplot(
    data = bar_df
    , aes(
        x = obs
        , y = value
        , color = value
        , shape = var
    )
) +
    geom_point(size = 10) +
    scale_shape_manual(
        values = c(
            'A' = 7
            , 'B' = "헐"
            , 'C' = 9
        )
    )

# 차트 제목 및 축제목 등의 텍스 설정

    # 축 제목 및 축 눈금값들의 조정
        ggplot(
            data = bar_df
            , aes(
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            theme(
                axis.title = element_text(
                    size = 20
                    , face = 'bold'
                    , angle = 45
                )
            )
        
        ggplot(
            data = bar_df
            , aes(
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            theme(
                axis.text.x = element_text(
                    size = 20
                    , face = 'italic'
                    , angle = 45
                )
                , axis.text.y = element_text(
                    size = 20
                    , face = 'bold'
                    , angle = 180
                )
                , axis.title = element_text(
                    size = 20
                    , face = 'bold'
                )
            )
    
    # 차트 제목과 축의 내용(label)과 서식 조정
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            labs(
                x = 'x 축 제목'
                , y = 'y 축 제목'
                , title = '차트의 제목'
            ) +
            theme(
                axis.title = element_text(size = 20)
                , plot.title = element_text(
                    size = 35
                    , hjust = 0.5 # 수평 위치 가운데
                )
            )
        
    # 차트 제목과 축의 내용을 표시하는 또 다른 방법
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            scale_x_continuous(name = 'x 축 제목') +
            scale_y_continuous(name = 'y 축 제목') +
            ggtitle('Title Graph') +
            theme(
                axis.title = element_text(size = 20)
                , plot.title = element_text(
                    size = 35
                    , hjust = 0.5
                )
            )
        
    # 차트 제목과 내용의 서식지정하는 또다른 방법
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            scale_x_continuous(name = 'x 축 제목') +
            scale_y_continuous(name = 'y 축 제목') +
            ggtitle('Title Graph') +
            theme(
                plot.title = element_text(
                    size = 35
                    , hjust = 0.5
                )
                , axis.title.x = element_text(
                    size = 20
                    , hjust = 0.1
                )
                , axis.title.y = element_text(
                    size = 20
                    , hjust = 0.1
                )
            )
        
    # x or y 축제목을 생략
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            scale_x_continuous(name = 'x 축 제목') +
            scale_y_continuous(name = 'y 축 제목') +
            ggtitle('Title Graph') +
            theme(
                plot.title = element_text(
                    size = 35
                    , hjust = 0.5
                )
                , axis.title.x = element_blank()
                , axis.title.y = element_text(size = 20)
            )
        
    # 부제목
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            labs(
                x = 'x 축 제목'
                , y = 'y 축 제목'
                , title = '차트의 제목'
                , subtitle = '여기는 부제목'
            ) +
            theme(
                axis.title = element_text(size=20)
                , plot.title = element_text(
                    size = 35
                    , hjust = 0.5
                )
                , plot.subtitle = element_text(
                    size = 15
                    , hjust = 0.1
                )
            )
    # annotate 함수 (그래프 내부에 관련 텍스트(label))
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            annotate(
                geom = 'text'
                , label = 'annotate 사용'
                , size = 10
                , x = 5
                , y = 80
            )
        
        ggplot(
            data = bar_df
            , aes (
                x = obs
                , y = value
                , color = value
            )
        ) +
            geom_point(size = 10) +
            annotate(
                geom = 'rect'
                , fill = '#FFA500'
                , xmin = 5
                , xmax = 7
                , ymin = 20
                , ymax = 30
            )
        