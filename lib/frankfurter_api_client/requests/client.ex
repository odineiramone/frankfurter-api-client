defmodule FrankfurterApiClient.Requests.Client do
  require Logger

  def get(url, params \\ []) do
    url
    |> get_request(params)
    |> process_response()
  end

  defp get_request(url, params) do
    try do
      url |> http_client().get!(params: params)
    rescue
      e ->
        Logger.error("#{Exception.message(e)}")
        Exception.message(e)
    end
  end

  defp process_response(%{status: 200} = response), do: {:ok, response.body}

  defp process_response(%{status: 404, body: body}) when body == "" do
    {:error, "No body returned for response"}
  end

  defp process_response(%{status: 404, body: body}), do: {:error, body["message"]}

  defp process_response(%{status: 422, body: body}), do: {:error, body["message"]}

  defp process_response(message), do: {:error, message}

  defp http_client() do
    Application.get_env(:frankfurter_api_client, :http_client)
  end
end
