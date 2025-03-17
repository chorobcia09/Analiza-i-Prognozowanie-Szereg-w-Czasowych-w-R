install.packages("tseries")
# Generacja danych czasowych
set.seed(123)
date_seq <- seq.Date(from = as.Date("2020-01-01"), by = "month", length.out = 60)
value <- cumsum(runif(60, min = -10, max = 10)) 
data <- data.frame(Date = date_seq, Value = value)
write.csv(data, "time_series_data.csv", row.names = FALSE)  

# Wizualizacja danych
library(ggplot2)
ggplot(data, aes(x = Date, y = Value)) +
  geom_line() +
  labs(title = "Wykres danych czasowych", x = "Data", y = "Wartość") +
  theme_minimal()

# Testy stacjonarności (ADF i KPSS)
library(tseries)
library(urca)

adf_test <- adf.test(data$Value, alternative = "stationary")
print(adf_test)

kpss_test <- ur.kpss(data$Value)
summary(kpss_test)

# Dekompozycja szeregu czasowego
ts_data <- ts(data$Value, start = c(2020, 1), frequency = 12)
decomposed <- decompose(ts_data)
plot(decomposed)

# Prognoza metodą Holta-Wintersa
hw_model <- HoltWinters(ts_data)
forecast_values <- predict(hw_model, n.ahead = 12)

# Wykres z prognozą Holta-Wintersa
plot(ts_data, xlim = c(2020, 2025), ylim = range(c(ts_data, forecast_values)),
     main = "Prognoza Holta-Wintersa", xlab = "Czas", ylab = "Wartość")
lines(forecast_values, col = "red", lty = 2)
legend("topright", legend = c("Dane rzeczywiste", "Prognoza"), col = c("black", "red"), lty = c(1, 2))

# Wyjaśnienie wpływu parametrów Holta-Wintersa
cat("Model Holta-Wintersa uwzględnia:\n")
cat("- Alfa (wygładzanie poziomu):", hw_model$alpha, "\n")
cat("- Beta (trend):", hw_model$beta, "\n")
cat("- Gamma (sezonowość):", hw_model$gamma, "\n")

if (!is.null(hw_model$alpha) && hw_model$alpha != 0) {
  cat("Szereg wymaga wyrównania (uwzględniono wygładzanie poziomu).\n")
}
if (!is.null(hw_model$beta) && hw_model$beta != 0) {
  cat("Uwzględniono wahania przypadkowe.\n")
}
if (!is.null(hw_model$gamma) && hw_model$gamma != 0) {
  cat("Uwzględniono wahania cykliczne i przypadkowe.\n")
}

# Prognoza metodą ARIMA
library(forecast)

arima_model <- auto.arima(ts_data)
forecast_arima <- forecast(arima_model, h = 12)

# Właściwe wywołanie plot dla obiektu forecast
plot(forecast_arima, main = "Prognoza ARIMA", xlab = "Czas", ylab = "Wartość")

# Analiza cross-korelacji
set.seed(456)
external_var <- cumsum(runif(60, min = -5, max = 5))

ccf(data$Value, external_var, main = "Cross-correlation")

# Eksport wyników prognozy ARIMA
write.csv(forecast_arima, "forecast_results.csv", row.names = FALSE)

