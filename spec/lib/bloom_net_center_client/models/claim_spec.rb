require 'spec_helper'

module BloomNetCenterClient
  RSpec.describe Claim, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:tracking_no, String) }
      it { is_expected.to have_attribute(:status, String) }
      it { is_expected.to have_attribute(:account, String) }
    end

  end
end
