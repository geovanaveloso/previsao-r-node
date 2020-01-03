needs(data.table)
needs(RemixAutoML)
needs(forecast)

attach(input[[1]])

###### AUTO ESCOLHA MODELO ESTATÍSTICO ######
forecast = RemixAutoML::AutoTS(data = setDT(faturado), TargetName = "Valor", DateName = "Data", FCPeriods = meses,
                               HoldOutPeriods = round(nrow(faturado)*0.2), TimeUnit = "month", 
                               EvaluationMetric = 'MAPE', InnerEval = 'AICc')
###### AUTO ESCOLHA MODELO ESTATÍSTICO ######

###### RETORNO PARA O NODE.JS ######
data.frame(forecast$Forecast)
###### RETORNO PARA O NODE.JS ######