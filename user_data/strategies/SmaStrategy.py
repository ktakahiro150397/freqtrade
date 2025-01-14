import talib.abstract as ta
from pandas import DataFrame

from freqtrade.strategy import IStrategy


class SMAStrategy(IStrategy):
    timeframe = "15m"

    # set the initial stoploss to -10%
    stoploss = -0.05

    # exit profitable positions at any time when the profit is greater than 1%
    minimal_roi = {"0": 0.05}

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # generate values for technical analysis indicators
        dataframe["rsi"] = ta.RSI(dataframe, timeperiod=14)

        # SMAを計算
        dataframe["sma_7"] = ta.SMA(dataframe, timeperiod=7)
        dataframe["sma_14"] = ta.SMA(dataframe, timeperiod=14)

        return dataframe

    def populate_entry_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # generate entry signals based on indicator values

        # sma_14 < sma_7 の場合、エントリー
        dataframe.loc[dataframe["sma_14"] < dataframe["sma_7"], ["enter_long", "enter_tag"]] = (
            1,
            "buy_signal_sma",
        )

        return dataframe

    def populate_exit_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # sma_7 > sma_14 の場合、エグジット
        dataframe.loc[dataframe["sma_7"] > dataframe["sma_14"], ["exit_long", "exit_tag"]] = (
            1,
            "exit_signal_sma",
        )

        return dataframe
