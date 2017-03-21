require "spec_helper"

module BloomNetCenterClient
  RSpec.describe Client, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      BloomNetCenterClient::GLOBAL_OPTS.each do |attr|
        it { is_expected.to have_attribute(attr, String) }
      end
    end

  end
end
