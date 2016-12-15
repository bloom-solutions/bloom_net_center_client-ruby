module BloomNetCentralClient
  class CreateClaimRequest < BaseRequest

    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :ref_no, String
    attribute :destination, String
    attribute :body, String, lazy: true, default: :default_body

    private

    def path
      "/api/v1/claims"
    end

    def default_action
      :post
    end

    def default_body
      {
        claim: {
          recipient_first_name: recipient_first_name,
          recipient_last_name: recipient_last_name,
          ref_no: ref_no,
          destination: destination,
        }
      }.to_json
    end

  end
end
