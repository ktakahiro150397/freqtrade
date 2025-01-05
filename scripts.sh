# Download candle data
freqtrade download-data --pairs BTC/USDT ETH/USDT XRP/USDT --timerange 20190101-20231231 --timeframes 15m 30m

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


# Backtest strategies in user_data_test dir

# 1 Get historical data
freqtrade download-data --userdir /workspaces/freqtrade/user_data_test --pairs BTC/USDT ETH/USDT XRP/USDT --timerange 20241001-20241231 --timeframes 5m 15m 30m 1h

# 2 Execute backtest with userdir
freqtrade backtesting \
    --userdir /workspaces/freqtrade/user_data_test \
    --strategy Bandtastic \
    --timerange 20241001-20241231

freqtrade backtesting \
    --userdir /workspaces/freqtrade/user_data_test \
    --strategy CustomStoplossWithPSAR \
    --timerange 20241001-20241231
