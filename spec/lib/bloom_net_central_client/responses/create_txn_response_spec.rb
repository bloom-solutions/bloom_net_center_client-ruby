require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe CreateTxnResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:txn) }
    end

    describe "#success?" do
      subject(:response) { described_class.new(code: code) }

      context "code is 201" do
        let(:code) { 201 }
        it { is_expected.to be_success }
      end

      context "code is not 201" do
        let(:code) { 422 }
        it { is_expected.to_not be_success }
      end
    end

    describe "#txn" do
      let(:body) do
        {
          data: {
            id: "remote-id",
            ref_no: "tracking",
            status: "remote-status",
          }
        }
      end
      let(:response) { described_class.new(body: body) }
      let(:txn) { response.txn }

      it "builds a Txn out of the response" do
        expect(txn).to be_a Txn
        expect(txn.id).to eq "remote-id"
        expect(txn.ref_no).to eq "tracking"
        expect(txn.status).to eq "remote-status"
      end
    end

  end
end
