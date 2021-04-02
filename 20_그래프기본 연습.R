#####################################################

# 1. marathon_2015_2017.csv
# 2. 체크타임 기준 현재 위치와 경도값을 얻어 냅니다.
# 리스트 데이터 생성 및 이용
# 함수사용 권장, 

# 참가자 한명당 기록상 7200초를 넘기는 지점의 위도와 경도를 새로운 컬럼으로 저장합니다
# marathon[, "Lat"], marathon[, "Long"]

# 3. 위도 경도별 인원수를 계산합니다
# marathon_agg = aggregate(marathon, Official.Time ~ Lat+Long, )
--------------------------------------
# k = table(marathon)
# k[1,1]
# k[2,2]

    
library('ggplot2')

checktime = 7200
point = list(
    X5K = c(42.24, -71.47)
    , X10K = c(42.27, -71.42)
    , X15K = c(42.28, -71.36)
    , X20K = c(42.29, -71.28)
    , X25K = c(42.32, -71.25)
    , X30K = c(42.34, -71.21)
    , X35K = c(42.35, -71.12)
    , X40K = c(42.35, -71.08)
)


# 1.
    marathon_df = read.csv('./R_Script/resource/marathon_merge[2015~2017].csv')
    marathon_df[1, ]

    getPosition = function(input) {
        if (input$X40K < checktime) {point$X40K}
        else if (input$X35K < checktime) {point$X35K}
        else if (input$X30K < checktime) {point$X30K}
        else if (input$X25K < checktime) {point$X25K}
        else if (input$X20K < checktime) {point$X20K}
        else if (input$X15K < checktime) {point$X15K}
        else if (input$X10K < checktime) {point$X10K}
        else if (input$X5K < checktime) {point$X5K}
    }
    
    getPositionLabel = function(input) {
        if (input$X40K < checktime) {'X40K'}
        else if (input$X35K < checktime) {'X35K'}
        else if (input$X30K < checktime) {'X30K'}
        else if (input$X25K < checktime) {'X25K'}
        else if (input$X20K < checktime) {'X20K'}
        else if (input$X15K < checktime) {'X15K'}
        else if (input$X10K < checktime) {'X10K'}
        else if (input$X5K < checktime) {'X5K'}
    }
    
    for (row in 1:nrow(marathon_df)) {
        marathon_df[row, "Lat"] = getPosition(marathon_df[row, ])[1]
        marathon_df[row, "Long"] = getPosition(marathon_df[row, ])[2]
        marathon_df[row, "position"] = getPositionLabel(marathon_df[row, ])
    }
    
    marathon_df
    
# 3.
    ggplot(
        data = marathon_df
        , aes(
            x = position
            , group = M.F
            , color = M.F
        )
    ) + geom_bar(alpha=0.5)
    