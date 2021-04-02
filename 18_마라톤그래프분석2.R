# 1. marathon 2015_2017.csv 변수에 저장
# 2. 나이에서 십의자리만 남기고 일의자리를 절사하여 연령대 필드명 Age_10을 만들고 절사한 값을 저장
# 3. Age_10을 기준으로 한 bar차트를 그립니다
# 4. 차트 제목 : 연령대별 참석인원, 축제목은 y축만 인원으로
# 5. 성별로 그룹, 빨강, 파랑으로 차트색 지정
# 6. 가장 인원이 많은 연령대의 bar위에 "최대참여 연령"이라고 annotate를 이용해 텍스트를 표시
# 7. 나머지 설정은 이전 차트의 내용을 따르거나 임의 조정
# (x 눈금, y 눈금, 각제목들의 글자 크기, 범례 설정 등)

# 1
    marathon_df = read.csv('./R_Script/resource/marathon_merge[2015~2017].csv')
# 2
    floor(marathon_df$Age/10) * 10 -> marathon_df$Age_10
    
    
# 3
    library('ggplot2')
    
    ggplot(
        data = marathon_df
        , aes(
            x = Age_10
            , group = M.F
            , fill = M.F
        )
    ) + geom_bar(
            position = 'dodge'
            , alpha = 0.8
        ) +
        labs(
            y = '인원'
            , title = '연령대별 참석인원'
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
        scale_x_continuous(
            limits = c(10, 80)
            , breaks = seq(10, 80, 10)
            , labels = seq(10, 80, 10)
        ) +
        scale_y_continuous(
            limits = c(0, 14000)
            , breaks = seq(0, 14000, 2000)
            , labels = seq(0, 14000, 2000)
        ) +
        annotate("text", x=40, y=max(table(marathon_df$Age_10, marathon_df$M.F)), label="최대참여 연령", size=6, color = 'magenta') + 
        scale_fill_manual(
            values = c("M"="blue", "F"="red")
        )
    
    table(marathon_df$Age_10)
    
    
    ageGenderTable = table(marathon_df$Age_10, marathon_df$M.F)
    max(ageGenderTable)
    match(ageGenderTable, max(ageGenderTable))
    