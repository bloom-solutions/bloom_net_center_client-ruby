require "api_client_base"
require "gem_config"
require "httparty"
require "virtus"
require "active_support/json"
require "active_support/core_ext/hash/indifferent_access"
require "active_support/core_ext/hash/slice"
require "active_support/core_ext/object"
require "active_support/core_ext/string/inflections"

module BloomNetCenterClient

  include GemConfig::Base
  GLOBAL_OPTS = %i[host token secret]

  with_configuration do
    has :host, classes: String
    has :token, classes: String
    has :secret, classes: String
  end

  def self.new(opts={})
    Client.new(global_opts.merge(opts))
  end

  private

  def self.global_opts
    GLOBAL_OPTS.each_with_object({}) do |var, hash|
      hash[var] = BloomNetCenterClient.configuration.send(var)
    end
  end

end

require "bloom_net_center_client/version"
require "bloom_net_center_client/coercers/indifferent_hash"
require "bloom_net_center_client/client"
require "bloom_net_center_client/models/claim"
require "bloom_net_center_client/models/txn"
require "bloom_net_center_client/requests/base_request"
require "bloom_net_center_client/requests/create_claim_request"
require "bloom_net_center_client/requests/create_txn_request"
require "bloom_net_center_client/requests/find_txn_request"
require "bloom_net_center_client/responses/base_response"
require "bloom_net_center_client/responses/create_claim_response"
require "bloom_net_center_client/responses/create_txn_response"
require "bloom_net_center_client/responses/find_txn_response"
