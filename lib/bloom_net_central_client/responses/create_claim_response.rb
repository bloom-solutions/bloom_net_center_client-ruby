module BloomNetCentralClient
  class CreateClaimResponse < BaseResponse

    attribute :claim, Object, lazy: true, default: :default_claim

    private

    def default_success
      code == 201
    end

    def default_claim
      claim_attrs = body[:data].slice(*%i[
        recipient_first_name
        recipient_last_name
        ref_no
        status
      ])
      BloomNetCentralClient::Claim.new(claim_attrs)
    end

  end
end
