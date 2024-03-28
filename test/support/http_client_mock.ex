defmodule HttpClientMock do
  def get!(_url, params: [response: response]), do: response
end
