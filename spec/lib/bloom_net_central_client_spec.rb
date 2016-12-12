require "spec_helper"

describe BloomNetCentralClient do
  it "has a version number" do
    expect(BloomNetCentralClient::VERSION).not_to be nil
  end

  it "is configurable" do
    described_class.configure do |c|
      c.host = "http://hello.com"
      c.base_account = "GACABC"
    end

    config = described_class.configuration
    expect(config.host).to eq "http://hello.com"
    expect(config.base_account).to eq "GACABC"
  end
end
