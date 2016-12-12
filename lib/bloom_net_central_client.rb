require "gem_config"
require "bloom_net_central_client/version"

module BloomNetCentralClient

  include GemConfig::Base

  with_configuration do
    has :host, classes: String
    has :base_account, classes: String
  end

end
