module BloomNetCenterClient
  class Client

    include APIClientBase::Client.module(default_opts: :default_opts)
    api_action :create_txn
    api_action :find_txn, args: [:id]
    api_action :create_claim

    BloomNetCenterClient::GLOBAL_OPTS.each do |attr|
      attribute attr, String
    end

    private

    def default_opts
      BloomNetCenterClient::GLOBAL_OPTS.each_with_object({}) do |attr, hash|
        hash[attr] = send(attr)
      end
    end

  end
end
