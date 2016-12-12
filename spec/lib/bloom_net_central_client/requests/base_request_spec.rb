require 'spec_helper'

module BloomNetCentralClient
  RSpec.describe BaseRequest, type: %i[virtus] do

    describe "attributes" do
      subject { described_class }
      it { is_expected.to have_attribute(:host, String) }
      it { is_expected.to have_attribute(:uri, String) }
    end

    describe "#uri" do
      it "is the host and path" do
        request = described_class.new(host: "http://abc.com", path: "/123")
        expect(request.uri).to eq "http://abc.com/123"
      end
    end

  end
end
