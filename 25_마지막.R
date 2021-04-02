library('ggplot2')
# install.packages('maps')
# install.packages('ggmap')

library('maps')
library('ggmap')

asia = map_data(
    map = 'world'
    , region = c(
        'South Korea'
        , 'North Korea'
        , 'China'
        , 'Japan'
    )
)

ggplot(
    data = asia
    , aes(
        x = long
        , y = lat
        , group = group
        , fill = region
    )
) + geom_polygon()

ggplot(
    data = asia
    , aes(
        x = long
        , y = lat
        , group = group
    )
) + geom_polygon(
    color = "#000000"
    , fill = "#FFFFFF"
)


korea = map_data(
    map = 'world'
    , region = c(
        'South Korea'
        , 'North Korea'
    )
)

ggplot(
    data = korea
    , aes(
        x = long
        , y = lat
        , group = group
    )
) + geom_polygon()

ggplot(
    data = korea
    , aes(
        x = long
        , y = lat
        , group = group
        , fill = region
    )
) + geom_polygon()

ggplot(
    data = korea
    , aes(
        x = long
        , y = lat
        , group = group
        , fill = region
    )
) + geom_polygon(
    color = "#000000"
    , fill = "#FFFFFF"
)

install.packages('rgdal')
library('rgdal')

shp = readOGR('./R_Script/resource/sido/si_do.shp')
df_shp = fortify(shp)

ggplot(
    data = df_shp
    , aes(
        x = long
        , y = lat
        , group = group
    )
) + geom_polygon(
    color = "#000000"
    , fill = "#FFFFFF"
)
