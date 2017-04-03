module BloomNetCenterClient
  class CreateTxnRequest < BaseRequest

    attribute :sender_first_name, String
    attribute :sender_last_name, String
    attribute :sender_street, String
    attribute :sender_city, String
    attribute :sender_province, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :recipient_street, String
    attribute :recipient_city, String
    attribute :recipient_mobile, String
    attribute :amount, BigDecimal
    attribute :currency, String
    attribute :body, String, lazy: true, default: :default_body

    BODY_ATTRS = %i[
      sender_first_name
      sender_last_name
      sender_street
      sender_city
      sender_province
      recipient_first_name
      recipient_last_name
      recipient_street
      recipient_city
      recipient_mobile
      amount
      currency
    ]

    private

    def default_action
      :post
    end

    def path
      "/api/v1/txns"
    end

    def default_body
      {
        data: {
          type: "txns",
          attributes: BODY_ATTRS.each_with_object({}) do |attr, hash|
            hash[attr.to_s.dasherize] = send(attr)
          end,
        }
      }.to_json
    end

  end
end
