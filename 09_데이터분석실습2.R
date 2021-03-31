# hh:mm:ss -> seconds
toSeq = function(df, col) { # 데이터프레임과 컬럼을 받고
    df_split = cSplit(df, splitCols=col, sep=":") # 받은 DF와 컬럼을 구분자로 나누고
    
    df_split = as.data.frame(df_split) # 연산가능하게 형변환
    
    # (시->초) + (분->초) + (초)
    (as.integer(df_split[, paste0(col, "_1")])
        * 60 * 60) + 
        (as.integer(df_split[, paste0(col, "_2")])
         * 60) + 
        (as.integer(df_split[, paste0(col, "_3")]))
}
 
# 1. marathon_results_2015.csv marathon_results_2016.csv marathon_results_2017.csv 를 읽는다.
    marathon_2015 = read.csv("./R_Script/resource/marathon_results_2015.csv")
    marathon_2016 = read.csv("./R_Script/resource/marathon_results_2016.csv")
    marathon_2017 = read.csv("./R_Script/resource/marathon_results_2017.csv")
    head(marathon_2015)
    head(marathon_2016)
    head(marathon_2017)

# 2. 각 df에 각 참가년도를 저장하는 Year열을 생성
    marathon_2015[, 'Year'] = '2015'
    marathon_2016[, 'Year'] = '2016'
    marathon_2017[, 'Year'] = '2017'
    
    head(marathon_2015)
    head(marathon_2016)
    head(marathon_2017)

# 3. 세개의 DF를 하나의 변수에 병합 (marathon_2015_2017)
    # 3-1 열을 맞춘다(X, Bib, Citizen, X.1, Proj.Time 제외)
        colnames(marathon_2015) # 1, 2, 9, 10, 21
        colnames(marathon_2016) # 1, 8, 9, 20
        colnames(marathon_2017) # 1, 2, 9, 10, 21
        marathon_2015_clean = marathon_2015[ , c(3:8, 11:20, 22:26)]
        marathon_2016_clean = marathon_2016[ , c(2:7, 10:19, 21:25)]
        marathon_2017_clean = marathon_2017[ , c(3:8, 11:20, 22:26)]
        
        colnames(marathon_2015_clean)
        colnames(marathon_2016_clean)
        colnames(marathon_2017_clean)
        
        head(marathon_2015_clean)
        head(marathon_2016_clean)
        head(marathon_2017_clean)

    # 3-2 동일한 열을 가진 DF 머지
        marathon_2015_2017 = rbind(marathon_2015_clean, marathon_2016_clean, marathon_2017_clean)

# 5. 각 기록을 초단위로 변경
    head(marathon_2015_2017)
    
    marathon_2015_2017[, 'X5K'] = toSeq(marathon_2015_2017, 'X5K')
    marathon_2015_2017[, 'X10K'] = toSeq(marathon_2015_2017, 'X10K')
    marathon_2015_2017[, 'X15K'] = toSeq(marathon_2015_2017, 'X15K')
    marathon_2015_2017[, 'X20K'] = toSeq(marathon_2015_2017, 'X20K')
    marathon_2015_2017[, 'Half'] = toSeq(marathon_2015_2017, 'Half')
    marathon_2015_2017[, 'X25K'] = toSeq(marathon_2015_2017, 'X25K')
    marathon_2015_2017[, 'X30K'] = toSeq(marathon_2015_2017, 'X30K')
    marathon_2015_2017[, 'X35K'] = toSeq(marathon_2015_2017, 'X35K')
    marathon_2015_2017[, 'X40K'] = toSeq(marathon_2015_2017, 'X40K')
    marathon_2015_2017[, 'Pace'] = toSeq(marathon_2015_2017, 'Pace')
    marathon_2015_2017[, 'Official.Time'] = toSeq(marathon_2015_2017, 'Official.Time')
    
    head(marathon_2015_2017)
    
# 6. Senior컬럼 추가 (나이 60 이상여부)
    marathon_2015_2017[, 'Senior'] = marathon_2015_2017[, 'Age'] >= 60
    head(marathon_2015_2017, 3)
    
# 7. 분포율
    prop.table(table(marathon_2015_2017$Year))
    prop.table(table(marathon_2015_2017$Year, marathon_2015_2017$Senior))
    prop.table(table(marathon_2015_2017$Year, marathon_2015_2017$Senior))*100
    round(prop.table(table(marathon_2015_2017$Year, marathon_2015_2017$Senior))*100)
    paste0(round(prop.table(table(marathon_2015_2017$Year, marathon_2015_2017$Senior))*100, 1), '%')
    

    