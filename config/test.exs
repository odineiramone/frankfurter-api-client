import Config

config :frankfurter_api_client,
  http_client: HttpClientMock

# Imprime na tela apenas logs de nivel warning e error
# durante os testes
config :logger, level: :warn
