# Analiza-i-prognozowanie-szeregow-w-zzasowych-w-R

## Opis projektu
Projekt implementuje analizę i prognozowanie szeregów czasowych przy użyciu języka R. Obejmuje generację danych czasowych, testy stacjonarności, dekompozycję szeregu, oraz prognozy przy użyciu modeli Holta-Wintersa i ARIMA.

## Wymagania
Projekt wymaga następujących pakietów R:
- tseries
- ggplot2
- urca
- forecast

Aby je zainstalować, można użyć komendy:
```r
install.packages(c("tseries", "ggplot2", "urca", "forecast"))
```
## Struktura kodu
- Generacja danych czasowych - Tworzenie fikcyjnych danych czasowych.
- Wizualizacja danych - Wykres szeregu czasowego.
- Testy stacjonarności - Testy ADF i KPSS.
- Dekompozycja szeregu czasowego - Rozkład składowych szeregu.
- Prognoza Holta-Wintersa - Model prognozowania z wygładzaniem wykładniczym.
- Prognoza ARIMA - Automatyczny dobór i prognozowanie modelem ARIMA.
- Analiza cross-korelacji - Badanie zależności między zmiennymi.
- Eksport wyników - Zapisywanie prognoz do plików CSV.

## Pliki wyjściowe
- time_series_data.csv - Wygenerowane dane czasowe.
- forecast_results.csv - Wyniki prognozy ARIMA.

## Wizualizacje
Skrypt generuje następujące wykresy:
- Szereg czasowy danych historycznych.
- Dekompozycja szeregu czasowego.
- Prognoza Holta-Wintersa.
- Prognoza ARIMA.
- Analiza cross-korelacji.
