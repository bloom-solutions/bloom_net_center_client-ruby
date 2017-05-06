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
            attributes: {
              "tracking-no" => "tracking no",
              "status" => "remote-status",
              "account" => "stellar-address",
            }
          }
        }
      end
      let(:response) { described_class.new(body: body) }
      let(:claim) { response.claim }

      it "builds a claim out of the response" do
        expect(claim).to be_a Claim
        expect(claim.tracking_no).to eq "tracking no"
        expect(claim.status).to eq "remote-status"
        expect(claim.account).to eq "stellar-address"
      end
    end

  end
end
