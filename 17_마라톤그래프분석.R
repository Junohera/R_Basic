# 1. marathon_2015_2017.csv
# 2. 나이별 참가자 인원수 bar
# 3. 차트제목 : 연령별 참석인원
# 4. 성별로 그룹을 설정해, 두개의 막대그래프가 인접되도록
# 5. x축제목 연령, y축 제목 참여인원
# 6. x축의 표현범위(limits) 18~80세로 설정, 구간간격 및 표현값은 10세 단위로 지정
# y축도 조정하되 적절한 설정값
# 7. 제목크기, 축제목, 눈금값크기 적당히
# 8. 범례는 그래프하단에 적절한 텍스트 크기로 조정하여 설정
# 9. 범례의 제목은 '성별'로 설정 후 크기 조정
# + labs(fill='성별')
# + theme(legend.title = element_text(size=15)
#         legend.text = element_text(size=15)
#         , 	legend.position = 'bottom')

library('ggplot2')

# 1
marathon_df = read.csv("./R_Script/resource/marathon_merge[2015~2017].csv")
# marathon_df = read.csv("./R_Script/resource/marathon_results_2015.csv")
    marathon_df
    marathon_df$Age
    
    head(marathon_df)
    
    colnames(marathon_df)
# 2, 3, 4, 5
    ggplot(
        data = marathon_df
        , aes(
            x = Age
            , group = M.F
            , fill = M.F
        )
    ) + geom_bar(position = 'dodge', alpha = 0.8) +
        labs(
            x = '연령'
            , y = '참여인원'
            , title = '연령별 참석인원'
            , fill = "성별"
        ) +
        scale_x_continuous(
            limits = c(18, 80)
            , breaks = seq(18, 80, 10)
            , labels = seq(18, 80, 10)
        ) +
        scale_y_continuous(
            breaks = seq(0, 2000, 200)
            , labels = seq(0, 2000, 200)
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
            , axis.title.x = element_text(
                size = 20
                , hjust = 0.5
                , face = 'bold'
            )
            , axis.title.y = element_text(
                size = 20
                , hjust = 0.5
                , face = 'bold'
            )
        )
    