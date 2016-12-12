module BloomNetCentralClient
  class FindTxnResponse < BaseResponse

    attribute :txn, Object, lazy: true, default: :default_txn

    private

    def default_txn
      txn_data = body[:data].first
      return nil if txn_data.nil?
      txn_attrs = txn_data.slice(*%i(
        id
        recipient_first_name
        recipient_last_name
        ref_no
        status
      ))
      BloomNetCentralClient::Txn.new(txn_attrs)
    end

    def default_success
      code == 200 && txn.present?
    end

  end
end
