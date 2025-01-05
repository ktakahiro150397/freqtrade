#!/bin/bash

# strategies=(
#     "Bandtastic"
#     "BreakEven"
#     "CustomStoplossWithPSAR"
#     "Diamond"
#     "FixedRiskRewardLoss"
#     "GodStra"
#     "Heracles"
#     "HourBasedStrategy"
#     "InformativeSample"
#     "MultiMa"
#     "PatternRecognition"
#     "PowerTower"
#     "Strategy001"
#     "Strategy001_custom_exit"
#     "Strategy002"
#     "Strategy003"
#     "Strategy004"
#     "Strategy005"
#     "Supertrend"
#     "SwingHighToSky"
#     "UniversalMACD"
#     "berlinguyinca"
#     "futures"
#     "hlhb"
#     "lookahead_bias"
#     "mabStra"
#     "multi_tf"
# )

strategies=(
    "Strategy001"
    "Strategy002"
    "Strategy003"
    "Strategy004"
    "UniversalMACD"
)


# 1 Get historical data
freqtrade download-data --userdir /workspaces/freqtrade/user_data_test --pairs BTC/USDT ETH/USDT XRP/USDT --timerange 20241001-20241231 --timeframes 5m 15m 30m 1h 4h

# 2 Execute backtest with userdir
for strategy in "${strategies[@]}"; do
    echo "Running backtest for strategy: $strategy"
    freqtrade backtesting \
        --userdir /workspaces/freqtrade/user_data_test \
        --strategy $strategy \
        --timerange 20241201-20241231
done
