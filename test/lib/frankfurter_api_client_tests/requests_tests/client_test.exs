defmodule FrankfurterApiClientTests.RequestsTests.ClientTest do
  use ExUnit.Case

  alias FrankfurterApiClient.Requests.Client

  describe "get/1" do
    test "recebendo resposta com status 200, retorna tupla de sucesso" do
      params = [
        response: %{status: 200, body: %{"content" => "content"}}
      ]

      assert Client.get("<apimock_url>", params) == {:ok, %{"content" => "content"}}
    end

    test "recebendo resposta com status 404 e body vazio, retorna tupla de erro" do
      params = [
        response: %{status: 404, body: ""}
      ]

      assert Client.get("<apimock_url>", params) ==
               {:error, "No body returned for response"}
    end

    test "recebendo resposta com status 404, retorna tupla de erro com mensagem" do
      params = [
        response: %{status: 404, body: %{"message" => "error message"}}
      ]

      assert Client.get("<apimock_url>", params) == {:error, "error message"}
    end

    test "recebendo resposta com status 422, retorna tupla de erro com mensagem" do
      params = [
        response: %{status: 422, body: %{"message" => "error message"}}
      ]

      assert Client.get("<apimock_url>", params) == {:error, "error message"}
    end

    test "recebendo qualquer outra resposta, retorna tupla de erro com resposta" do
      params = [response: %{}]

      assert Client.get("<apimock_url>", params) == {:error, %{}}
    end
  end
end
