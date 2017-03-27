module BloomNetCenterClient
  class CreateClaimResponse < BaseResponse

    attribute :claim, Object, lazy: true, default: :default_claim

    private

    def default_claim
      claim_attrs = body[:data].slice(*%i[
        recipient_first_name
        recipient_last_name
        ref_no
        status
      ])
      BloomNetCenterClient::Claim.new(claim_attrs)
    end

  end
end
