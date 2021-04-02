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
    
    check_time = 7200
    
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
    
    library('ggplot2')
    
    
    # 1.
    marathon = read.csv('./R_Script/resource/marathon_merge[2015~2017].csv')
    marathon[1, ]
    
    getLat = function(x) {
        if (x$X40K < check_time) {Lat = point$X40K[1]}
        else if (x$X35K < check_time) {Lat = point$X35K[1]}
        else if (x$X30K < check_time) {Lat = point$X30K[1]}
        else if (x$X25K < check_time) {Lat = point$X25K[1]}
        else if (x$X20K < check_time) {Lat = point$X20K[1]}
        else if (x$X15K < check_time) {Lat = point$X15K[1]}
        else if (x$X10K < check_time) {Lat = point$X10K[1]}
        else if (x$X5K < check_time) {Lat = point$X5K[1]}
        return(Lat)
    }
    
    getLong = function(x) {
        if (x$X40K < check_time) {Long = point$X40K[2]}
        else if (x$X35K < check_time) {Long = point$X35K[2]}
        else if (x$X30K < check_time) {Long = point$X30K[2]}
        else if (x$X25K < check_time) {Long = point$X25K[2]}
        else if (x$X20K < check_time) {Long = point$X20K[2]}
        else if (x$X15K < check_time) {Long = point$X15K[2]}
        else if (x$X10K < check_time) {Long = point$X10K[2]}
        else if (x$X5K < check_time) {Long = point$X5K[2]}
        return(Long)
    }
    
    for (i in 1:nrow(marathon)) {
        marathon[i, "Lat"] = getLat(marathon[i, ])
        marathon[i, "Long"] = getLong(marathon[i, ])
    }
    
    tail(marathon)
    
    # marathon 데이터에서 Lat + Long(세트표시) 컬럼을 기준으로
    # Official.Time 컬럼의 length(길이, 갯수)를 계산합니다.
    # python의 groupby와 유사
    marathon_agg = aggregate(Official.Time~Lat+Long, marathon, length)
    marathon_agg
    
    marathonL = marathon[, c('Lat', 'Long')]
    k = table(marathonL)
    k
    
    p = data.frame(
        Lat = c(
            42.27
            , 42.28
            , 42.29
            , 42.32
            , 42.34
            , 42.35
            , 42.35
        )
        , Long = c(
            -71.42
            , -71.36
            , -71.28
            , -71.25
            , -71.12
            , -71.12
            , -71.08
        )
        , cnt = c(
            135
            , 12161
            , 40653
            , 23870
            , 2579
            , 164
            , 76
        )
        , stringsAsFactors = FALSE
    )
    p
    
    ggplot(
        data = p
        , aes(
            x = Lat
            , y = Long
            , color = cnt
        )
    ) +
        geom_point(
            size = sqrt(p$cnt) / 8
            , alpha = 0.5
        ) +
        annotate(
            geom = 'text'
            , label = p$cnt
            , size = 5
            , x = p$Lat
            , y = p$Long
        ) +
        labs(
            title = '2시간 경과 후 구간별 인원수'
            , color = '인원수'
        ) +
        theme(
            axis.title = element_text(size = 15)
            , plot.title = element_text(size = 35, hjust = 0.5)
            , axis.text = element_text(size = 15)
            , legend.title = element_text(size = 15)
            , legend.text = element_text(size = 15)
        )
    