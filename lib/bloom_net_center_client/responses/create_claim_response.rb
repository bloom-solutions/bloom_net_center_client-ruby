module BloomNetCenterClient
  class CreateClaimResponse < BaseResponse

    attribute :claim, Object, lazy: true, default: :default_claim

    private

    def default_claim
      attribute_params = body[:data][:attributes]
      return nil if attribute_params.nil?

      attributes = BloomNetCenterClient::Claim::ATTRS.each_with_object({}) do |attr, hash|
        attr_dasherized = attr.to_s.dasherize
        hash[attr] = body[:data][attr_dasherized] ||
          attribute_params[attr_dasherized]
      end
      BloomNetCenterClient::Claim.new(attributes)
    end

  end
end
