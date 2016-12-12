require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe CreateTxnRequest, type: %i[virtus] do

    it "inherits from BaseRequest" do
      expect(described_class < BaseRequest).to be true
    end

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:recipient_first_name, String) }
      it { is_expected.to have_attribute(:recipient_last_name, String) }
    end

  end
end
