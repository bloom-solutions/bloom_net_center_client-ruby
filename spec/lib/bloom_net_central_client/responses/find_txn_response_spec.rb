require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe FindTxnResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:txn) }
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

    describe "#txn" do
      let(:body) { { data: data } }
      let(:response) { described_class.new(body: body) }
      subject(:txn) { response.txn }

      context "there is a result" do
        let(:data) do
          [
            {
              id: "remote-id",
              ref_no: "tracking",
              status: "remote-status",
              recipient_first_name: "Testy",
              recipient_last_name: "McTestface",
            }
          ]
        end

        it "builds a Txn out of the response" do
          expect(txn).to be_a Txn
          expect(txn.id).to eq "remote-id"
          expect(txn.ref_no).to eq "tracking"
          expect(txn.status).to eq "remote-status"
          expect(txn.recipient_first_name).to eq "Testy"
          expect(txn.recipient_last_name).to eq "McTestface"
        end
      end

      context "there is no result" do
        let(:data) { [] }
        it { is_expected.to be_nil }
      end
    end

  end
end
