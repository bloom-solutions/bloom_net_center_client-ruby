module BloomNetCentralClient
  class CreateTxnResponse < BaseResponse

    attribute :txn, Object, lazy: true, default: :default_txn

    private

    def default_txn
      BloomNetCentralClient::Txn.new(body[:data].slice(:id, :ref_no, :status))
    end

  end
end
