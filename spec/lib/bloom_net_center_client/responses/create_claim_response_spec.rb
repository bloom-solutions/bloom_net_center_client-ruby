require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateClaimResponse, type: %i[virtus] do

    it "inherits from BaseResponse" do
      expect(described_class < BaseResponse).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:claim) }
    end

    describe "#claim" do
      let(:body) do
        {
          data: {
            recipient_first_name: "recipient first name",
            recipient_last_name: "recipient last name",
            ref_no: "tracking",
            status: "remote-status",
          }
        }
      end
      let(:response) { described_class.new(body: body) }
      let(:claim) { response.claim }

      it "builds a claim out of the response" do
        expect(claim).to be_a Claim
        expect(claim.recipient_first_name).to eq "recipient first name"
        expect(claim.recipient_last_name).to eq "recipient last name"
        expect(claim.ref_no).to eq "tracking"
        expect(claim.status).to eq "remote-status"
      end
    end

  end
end
