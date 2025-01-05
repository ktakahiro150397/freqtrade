# Download candle data
freqtrade download-data --pairs BTC/USDT ETH/USDT XRP/USDT --timerange 20190101-20231231 --timeframes 1m 5m　15m15m

# Backtest
freqtrade backtesting --strategy SampleStrategy --timerange 20190101-20190201 --timeframe 5m
freqtrade backtesting --strategy MyStrategy --timerange 20190101-20190201 --timeframe 1m

# Install WebUI
freqtrade install-ui

# Run bot
# Web UI : http://localhost:8080/
freqtrade trade -s SampleStrategy -s MyStrategy
freqtrade trade --strategy MyStrategy

# Run webserver
freqtrade webserver

docker compose -f docker-compose-webserver.yml up -d