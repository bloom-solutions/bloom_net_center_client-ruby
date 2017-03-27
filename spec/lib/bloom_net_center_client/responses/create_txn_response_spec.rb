require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateTxnResponse, type: %i[virtus] do

    it "inherits from TxnResponse" do
      expect(described_class < TxnResponse).to be true
    end

  end
end
