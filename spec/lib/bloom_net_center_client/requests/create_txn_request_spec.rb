require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe CreateTxnRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:sender_first_name, String) }
      it { is_expected.to have_attribute(:sender_last_name, String) }
      it { is_expected.to have_attribute(:sender_street, String) }
      it { is_expected.to have_attribute(:sender_city, String) }
      it { is_expected.to have_attribute(:sender_province, String) }
      it { is_expected.to have_attribute(:recipient_first_name, String) }
      it { is_expected.to have_attribute(:recipient_last_name, String) }
      it { is_expected.to have_attribute(:recipient_street, String) }
      it { is_expected.to have_attribute(:recipient_city, String) }
      it { is_expected.to have_attribute(:recipient_mobile, String) }
      it { is_expected.to have_attribute(:amount, BigDecimal) }
      it { is_expected.to have_attribute(:currency, String) }
    end

    describe "#body" do
      let(:request) { described_class.new }
      let(:body) { JSON.parse(request.body).with_indifferent_access }

      it "has the correct type" do
        expect(body[:data][:type]).to eq "txns"
      end

      described_class::BODY_ATTRS.each do |attr|
        it "has #{attr.to_s.dasherize} as an attribute" do
          expect(body[:data][:attributes]).to have_key(attr.to_s.dasherize)
        end
      end
    end

  end
end
