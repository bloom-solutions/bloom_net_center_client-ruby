module BloomNetCenterClient
  class FindTxnRequest < BaseRequest

    attribute :id, String

    private

    def path
      "/api/v1/txns/:id"
    end

  end
end
