require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:headers) }
      it do
        is_expected.to have_attribute(:body, String).with_default(:default_body)
      end
      it { is_expected.to have_attribute(:token, String) }
      it { is_expected.to have_attribute(:secret, String) }
      it { is_expected.to have_attribute(:signature, String) }
    end

    describe "#headers" do
      let(:request) { described_class.new(token: "token", signature: "sig") }
      let(:headers) { request.headers }

      it "has jsonapi headers" do
        expect(headers["Content-Type"]).to eq "application/vnd.api+json"
        expect(headers["Accept"]).to eq "application/vnd.api+json"
        expect(headers["Authorization"]).to eq "HMAC-SHA256 token:sig"
      end
    end

    describe "#signature" do
      let(:request) { described_class.new(secret: "sekret", body: body) }
      let(:body) { {i: "body"}.to_json }
      let(:expected_signature) do
        OpenSSL::HMAC.hexdigest("SHA256", "sekret", body)
      end

      it "is an HMAC-SHA256 signature of the body with the secret" do
        expect(request.signature).to eq expected_signature
      end
    end

  end
end
