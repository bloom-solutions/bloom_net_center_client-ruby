require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe BaseResponse, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:body) }
      it { is_expected.to have_attribute(:code, Integer) }
      it { is_expected.to have_attribute(:success) }
    end

    describe "#body" do
      let(:raw_response) do
        instance_double(HTTParty::Response, body: {hi: "there"}.to_json)
      end
      let(:response) { described_class.new(raw_response: raw_response) }
      let(:body) { response.body }

      it "is the parsed body of the raw_response" do
        expect(body[:hi]).to eq "there"
      end
    end

    describe "#code" do
      let(:raw_response) { instance_double(HTTParty::Response, code: 422) }
      let(:response) { described_class.new(raw_response: raw_response) }

      it "defaults to the raw_response's code" do
        expect(response.code).to eq 422
      end
    end

  end
end
