require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe BaseResponse, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:raw_response) }
      it { is_expected.to have_attribute(:body) }
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

  end
end
