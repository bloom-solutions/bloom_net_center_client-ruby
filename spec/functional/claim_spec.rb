require 'spec_helper'

RSpec.describe "Claim a Txn", vcr: {record: :once} do

  it "claims a txn" do
    client = BloomNetCenterClient.
      new(CONFIG.slice(*BloomNetCenterClient::GLOBAL_OPTS))

    # Until one of the following happens, we can't do a full cycle of tests
    #
    # - stellar-sdk is able to easily send payments with memos
    # - we use bridge to send
    # - we migrate to unique accounts per txn

    response = client.create_claim(
      ref_no: "SOMERANDOM",
      account: "GDYRAPR626KVQVEF2HTPGR6TCAHVYVGKBO63PZA4FGKZAYAWIC5GBTP2",
    )

    expect(response).to be_success
  end

end
