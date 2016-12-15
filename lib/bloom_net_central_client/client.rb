module BloomNetCentralClient
  class Client

    include Virtus.model
    attribute :host, String

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :create_txn
    api_action :create_claim

    private

    def default_opts
      { host: host }
    end

  end
end
