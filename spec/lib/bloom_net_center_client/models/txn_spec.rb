require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe Txn, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:status, String) }
      it { is_expected.to have_attribute(:sender_first_name, String) }
      it { is_expected.to have_attribute(:sender_last_name, String) }
      it { is_expected.to have_attribute(:sender_street, String) }
      it { is_expected.to have_attribute(:sender_city, String) }
      it { is_expected.to have_attribute(:sender_province, String) }
      it { is_expected.to have_attribute(:sender_contact_number, String) }
      it { is_expected.to have_attribute(:recipient_first_name, String) }
      it { is_expected.to have_attribute(:recipient_last_name, String) }
      it { is_expected.to have_attribute(:recipient_street, String) }
      it { is_expected.to have_attribute(:recipient_city, String) }
      it { is_expected.to have_attribute(:recipient_province, String) }
      it { is_expected.to have_attribute(:recipient_contact_number, String) }
      it { is_expected.to have_attribute(:amount, BigDecimal) }
      it { is_expected.to have_attribute(:account, String) }
      it { is_expected.to have_attribute(:currency, String) }
    end

  end
end
