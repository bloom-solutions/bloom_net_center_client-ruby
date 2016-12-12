require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe Txn, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:id, String) }
      it { is_expected.to have_attribute(:ref_no, String) }
      it { is_expected.to have_attribute(:status, String) }
    end

  end
end
