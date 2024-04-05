defmodule FrankfurterApiClient do
  alias FrankfurterApiClient.Requests

  defdelegate latest(params \\ []), to: Requests, as: :latest
  defdelegate historical(date, params \\ []), to: Requests, as: :historical
  defdelegate time_series(start_date, end_date, params \\ []), to: Requests, as: :time_series
  defdelegate conversion(params \\ []), to: Requests, as: :conversion
  defdelegate currencies, to: Requests, as: :currencies
end
