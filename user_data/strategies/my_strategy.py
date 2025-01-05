import talib.abstract as ta
from pandas import DataFrame

from freqtrade.strategy import IStrategy


class MyStrategy(IStrategy):
    timeframe = "15m"

    # set the initial stoploss to -10%
    stoploss = -0.05

    # exit profitable positions at any time when the profit is greater than 1%
    minimal_roi = {"0": 0.05}

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # generate values for technical analysis indicators
        dataframe["rsi"] = ta.RSI(dataframe, timeperiod=14)

        return dataframe

    def populate_entry_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # generate entry signals based on indicator values
        dataframe.loc[(dataframe["rsi"] < 30), ["enter_long", "enter_tag"]] = (1, "buy_signal_rsi")

        # 動作確認用に、常にロングエントリーする
        # dataframe["enter_long"] = 1

        return dataframe

    def populate_exit_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        # generate exit signals based on indicator values
        dataframe.loc[(dataframe["rsi"] > 70), ["exit_long", "exit_tag"]] = (1, "exit_rsi")

        # 動作確認用に、最新以外のロングポジションをクローズする
        # dataframe.loc[dataframe["close"].shift(-1).notna(), "exit_long"] = 1

        return dataframe
