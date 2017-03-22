module BloomNetCenterClient
  class CreateClaimRequest < BaseRequest

    attribute :ref_no, String
    attribute :account, String
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
        data: {
          type: "claims",
          attributes: {
            "ref-no" => ref_no,
            account: account,
          }
        }
      }.to_json
    end

  end
end
