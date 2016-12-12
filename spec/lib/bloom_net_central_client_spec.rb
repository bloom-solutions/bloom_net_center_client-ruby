require "spec_helper"

describe BloomNetCentralClient do
  it "has a version number" do
    expect(BloomNetCentralClient::VERSION).not_to be nil
  end

  it "is configurable" do
    described_class.configure do |c|
      c.host = "http://hello.com"
    end

    config = described_class.configuration
    expect(config.host).to eq "http://hello.com"
  end

  describe ".new" do
    it "initializes a BloomNetCentralClient::Client" do
      client = described_class.new(host: "http://abc.com")
      expect(client).to be_a described_class::Client
      expect(client.host).to eq "http://abc.com"

      BloomNetCentralClient.configure { |c| c.host = "http://xyz.com" }
      client = described_class.new
      expect(client).to be_a described_class::Client
      expect(client.host).to eq "http://xyz.com"
    end
  end

end
