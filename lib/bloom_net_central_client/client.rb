module BloomNetCentralClient
  class Client

    include Virtus.model
    attribute :host, String

    def create_txn(opts)
      request = CreateTxnRequest.new(opts.merge(default_opts))
      raw_response = request.()
      CreateTxnResponse.new(raw_response: raw_response)
    end

    private

    def default_opts
      { host: host }
    end

  end
end
