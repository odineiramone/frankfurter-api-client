defmodule RequestsTest do
  use ExUnit.Case

  alias FrankfurterApiClient.Requests

  describe "latest/2" do
    test "chama a função injetada passando parametros" do
      request_client_mock = fn url, params ->
        send(self(), :mock_get_request)

        assert url == "https://api.frankfurter.app/latest"

        assert params == [test: :test]
      end

      Requests.latest(request_client_mock, test: :test)

      assert_received :mock_get_request
    end
  end

  describe "historical/3" do
    test "chama a função injetada passando parametros" do
      request_client_mock = fn url, params ->
        send(self(), :mock_get_request)

        assert url == "https://api.frankfurter.app/<date>"
        assert params == [test: :test]
      end

      Requests.historical("<date>", request_client_mock, test: :test)

      assert_received :mock_get_request
    end
  end

  describe "time_series/4" do
    test "chama a função injetada passando parametros" do
      request_client_mock = fn url, params ->
        send(self(), :mock_get_request)

        assert url == "https://api.frankfurter.app/<start_date>..<end_date>"
        assert params == [test: :test]
      end

      Requests.time_series("<start_date>", "<end_date>", request_client_mock, test: :test)

      assert_received :mock_get_request
    end
  end

  describe "conversion/2" do
    test "chama a função injetada passando parametros" do
      request_client_mock = fn url, params ->
        send(self(), :mock_get_request)

        assert url == "https://api.frankfurter.app/latest"
        assert params == [amount: 1000, from: "USD", to: "BRL"]
      end

      Requests.conversion(request_client_mock, amount: 1000, from: "USD", to: "BRL")

      assert_received :mock_get_request
    end
  end

  describe "currencies/1" do
    test "chama a função injetada passando parametros" do
      request_client_mock = fn url, params ->
        send(self(), :mock_get_request)

        assert url == "https://api.frankfurter.app/currencies"
        assert params == []
      end

      Requests.currencies(request_client_mock)

      assert_received :mock_get_request
    end
  end
end
