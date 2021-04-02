# 1. marathon_2015_2017.csv
# 2. 최종기록을 연령에 따라 point로 표시
# 3. 남자 참가자와 여자참가자를 빨강, 파랑으로 구분
# 4. 겹쳐서 보이지 않는 포인트가 없도록 alpha 지정
# 5. 차트의 제목 축 및 범례는 임의

library('ggplot2')

# 1
    marathon_df = read.csv("./R_Script/resource/marathon_merge[2015~2017].csv")
    
    marathon_df

# 2
    ggplot(
        data = marathon_df
        , aes(
            x = Age
            , y = Official.Time
            , group = M.F
            , color = M.F
        )
    ) +
        geom_point(alpha=0.1) + 
        scale_color_manual(
            values = c("M"="blue", "F"="red")
        ) +
        labs(
            x = '연령'
            , y = '완주시간'
            , title = '연령별 완주기록 분포도'
        ) +
        theme(
            legend.title = element_text(size=15)
            , legend.text = element_text(size=15)
            , legend.position = 'bottom'
            , plot.title = element_text(
                size = 35
                , hjust = 0.5
                , face = 'bold'
            )
            , axis.title.x = element_blank()
            , axis.title.y = element_text(
                size = 20
                , hjust = 0.5
                , face = 'bold'
            )
        ) +
        theme_classic()
    