module BloomNetCenterClient
  class FindTxnRequest < BaseRequest

    attribute :ref_no, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :params, String, lazy: true, default: :default_params

    private

    def path
      "/api/v1/txns"
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
