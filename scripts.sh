# Download candle data
freqtrade download-data --pairs BTC/USDT ETH/USDT XRP/USDT --timerange 20190101-20231231 --timeframes 5m

# Backtest
freqtrade backtesting --strategy SampleStrategy --timerange 20190101-20190201 --timeframe 5m
freqtrade backtesting --strategy MyStrategy --timerange 20190101-20190201 --timeframe 5m

