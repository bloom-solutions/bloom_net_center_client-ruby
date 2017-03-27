require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe Claim, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:recipient_first_name, String) }
      it { is_expected.to have_attribute(:recipient_last_name, String) }
      it { is_expected.to have_attribute(:ref_no, String) }
      it { is_expected.to have_attribute(:status, String) }
    end

  end
end
