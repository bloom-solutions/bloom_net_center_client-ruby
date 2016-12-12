module BloomNetCentralClient
  class CreateClaimRequest < BaseRequest

    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :ref_no, String
    attribute :destination, String
    attribute :headers, String, lazy: true, default: :default_headers
    attribute :body, String, lazy: true, default: :default_body
    attribute(:serialized_body, String, {
      lazy: true,
      default: :default_serialized_body,
    })

    def call
      HTTParty.post(uri, headers: headers, body: serialized_body)
    end

    private

    def default_path
      "/api/v1/claims"
    end

    def default_headers
      {"Content-Type" => "application/json"}
    end

    def default_body
      {
        claim: {
          recipient_first_name: recipient_first_name,
          recipient_last_name: recipient_last_name,
          ref_no: ref_no,
          destination: destination,
        }
      }
    end

    def default_serialized_body
      body.to_json
    end

  end
end
