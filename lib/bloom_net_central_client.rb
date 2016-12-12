require "gem_config"
require "httparty"
require "virtus"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/hash/slice"
require "bloom_net_central_client/version"
require "bloom_net_central_client/coercers/indifferent_hash"
require "bloom_net_central_client/client"
require "bloom_net_central_client/models/txn"
require "bloom_net_central_client/requests/base_request"
require "bloom_net_central_client/requests/create_txn_request"
require "bloom_net_central_client/responses/base_response"
require "bloom_net_central_client/responses/create_txn_response"

module BloomNetCentralClient

  include GemConfig::Base

  with_configuration do
    has :host, classes: String
  end

  def self.new(opts)
    Client.new(opts)
  end

end
