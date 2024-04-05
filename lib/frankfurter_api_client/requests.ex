defmodule FrankfurterApiClient.Requests do
  @conversion_required_fields ~w(amount from to)a

  alias FrankfurterApiClient.Requests.Client

  def latest(get_request \\ &Client.get/2, params \\ []) do
    (base_url() <> "/latest")
    |> get_request.(params)
  end

  def historical(date, get_request \\ &Client.get/2, params \\ []) do
    (base_url() <> "/" <> date) |> get_request.(params)
  end

  def time_series(start_date, end_date, get_request \\ &Client.get/2, params \\ []) do
    IO.puts(base_url() <> "/" <> start_date <> ".." <> end_date)

    (base_url() <> "/" <> start_date <> ".." <> end_date)
    |> get_request.(params)
  end

  def conversion(get_request \\ &Client.get/2, params) do
    get_request
    |> latest([@conversion_required_fields, fetch_values(params)] |> List.zip())
  end

  def currencies(get_request \\ &Client.get/2) do
    (base_url() <> "/currencies") |> get_request.([])
  end

  defp fetch_values(params) do
    @conversion_required_fields
    |> Enum.map(fn field -> Keyword.fetch!(params, field) end)
  end

  defp base_url do
    Application.get_env(:frankfurter_api, :base_url) || System.get_env("FRANKFURTER_API_BASE_URL") ||
      "https://api.frankfurter.app"
  end
end
