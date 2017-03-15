module BloomNetCenterClient
  class CreateTxnRequest < BaseRequest

    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :body, String, lazy: true, default: :default_body

    private

    def default_action
      :post
    end

    def path
      "/api/v1/txns"
    end

    def default_body
      {
        txn: {
          recipient_first_name: recipient_first_name,
          recipient_last_name: recipient_last_name,
        }
      }.to_json
    end

  end
end
