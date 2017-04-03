require 'spec_helper'

RSpec.describe "Find Txn", vcr: {record: :once} do

  it "finds a txn" do
    client = BloomNetCenterClient.
      new(CONFIG.slice(*BloomNetCenterClient::GLOBAL_OPTS))
    create_txn_response = client.create_txn(
      sender_first_name: "Fatima",
      sender_last_name: "Roberto",
      sender_street: "24 Lilian St",
      sender_city: "Sum City",
      sender_province: "Sum Province",
      recipient_first_name: "Mike",
      recipient_last_name: "Roberto",
      recipient_street: "33 Up St",
      recipient_city: "Upcity",
      recipient_mobile: "+638188927288",
      amount: 2050.0,
      currency: "PHP",
    )

    expect(create_txn_response).to be_success

    response = client.find_txn(create_txn_response.txn.id)

    expect(response).to be_success
    expect(response.txn.sender_first_name).to eq "Fatima"
  end

end
