module BloomNetCenterClient
  class TxnResponse < BaseResponse

    attribute :txn, Object, lazy: true, default: :default_txn

    private

    def default_txn
      attribute_params = body[:data][:attributes]
      return nil if attribute_params.nil?

      attributes = Txn::ATTRS.each_with_object({}) do |attr, hash|
        attr_dasherized = attr.to_s.dasherize
        hash[attr] = body[:data][attr_dasherized] ||
          attribute_params[attr_dasherized]
      end
      BloomNetCenterClient::Txn.new(attributes)
    end

  end
end
