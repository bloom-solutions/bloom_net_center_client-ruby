require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateTxnResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:txn) }
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
