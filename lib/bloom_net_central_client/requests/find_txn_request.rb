module BloomNetCentralClient
  class FindTxnRequest < BaseRequest

    attribute :ref_no, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :headers, String, lazy: true, default: :default_headers
    attribute :params, String, lazy: true, default: :default_params

    def call
      HTTParty.get(uri, headers: headers, params: params)
    end

    private

    def default_path
      "/api/v1/txns"
    end

    def default_headers
      {"Content-Type" => "application/json"}
    end

    def default_params
      {
        ref_no: ref_no,
        recipient_first_name: recipient_first_name,
        recipient_last_name: recipient_last_name,
      }
    end

  end
end
