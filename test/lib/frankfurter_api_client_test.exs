defmodule FrankfurterApiClientTest do
  use ExUnit.Case

  describe "módulo responde as seguintes funções" do
    test "latest/1" do
      list = FrankfurterApiClient.__info__(:functions)

      assert Enum.any?(list, fn tuple -> tuple == {:latest, 1} end)
    end

    test "historical/2" do
      list = FrankfurterApiClient.__info__(:functions)

      assert Enum.any?(list, fn tuple -> tuple == {:historical, 2} end)
    end

    test "time_series/3" do
      list = FrankfurterApiClient.__info__(:functions)

      assert Enum.any?(list, fn tuple -> tuple == {:time_series, 3} end)
    end

    test "conversion/1" do
      list = FrankfurterApiClient.__info__(:functions)

      assert Enum.any?(list, fn tuple -> tuple == {:conversion, 1} end)
    end

    test "currencies/0" do
      list = FrankfurterApiClient.__info__(:functions)

      assert Enum.any?(list, fn tuple -> tuple == {:currencies, 0} end)
    end
  end
end
