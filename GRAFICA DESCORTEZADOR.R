boxplot(EXCEL_DATOS, outline = T,
        xlab= "Años evaluados",
        ylab= "Índice dNDVI",
        main= "Rangos de valores de dNDVI",
        col = colorRampPalette(c('blue2',"dodgerblue","lightyellow","darkorange", 'red'))(7))

summary(EXCEL_DATOS)
