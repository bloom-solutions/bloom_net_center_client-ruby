module BloomNetCenterClient
  class FindTxnResponse < TxnResponse

    private

    def default_success
      code == 200 && txn.present?
    end

  end
end
