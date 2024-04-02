# Esse arquivo é responsável por configurar a sua aplicação
# e suas dependencias com ajuda do módulo Mix.Config.
#
# Esse arquivo de configuração é carregado antes de qualquer
# dependência e é restrito a esse projeto.

# Configuração geral da aplicação
import Config

config :frankfurter_api_client,
  http_client: Req

# Importa a configuração específica por ambiente. Essa linha precisa
# estar no final desse aquivo pq ela sobreescreve a configuração
# que você fez aqui em cima.
import_config "#{config_env()}.exs"
