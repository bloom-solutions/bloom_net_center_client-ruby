require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe FindTxnResponse, type: %i[virtus] do

    it "inherits from TxnResponse" do
      expect(described_class < TxnResponse).to be true
    end

    describe "#success?" do
      subject(:response) { described_class.new(code: code, txn: txn) }

      context "code is 200, there is a txn" do
        let(:code) { 200 }
        let(:txn) { Txn.new }
        it { is_expected.to be_success }
      end

      context "code is 200, there is no txn" do
        let(:code) { 200 }
        let(:txn) { nil }
        it { is_expected.to_not be_success }
      end

      context "code is not 200" do
        let(:code) { 400 }
        let(:txn) { Txn.new }
        it { is_expected.to_not be_success }
      end
    end

  end
end
