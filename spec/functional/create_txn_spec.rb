require 'spec_helper'

RSpec.describe "Create Txn", vcr: {record: :once} do

  it "creates a txn" do
    client = BloomNetCenterClient.
      new(CONFIG.slice(*BloomNetCenterClient::GLOBAL_OPTS))
    response = client.create_txn(
      sender_first_name: "Fatima",
      sender_last_name: "Roberto",
      sender_street: "24 Lilian St",
      sender_city: "Sum City",
      sender_province: "Sum Province",
      recipient_first_name: "Mike",
      recipient_last_name: "Roberto",
      recipient_street: "33 Up St",
      recipient_city: "Upcity",
      recipient_contact_number: "+638188927288",
      amount: 2050.0,
      currency: "PHP",
    )

    expect(response).to be_success
    txn = response.txn

    expect(txn.id).to be_present
  end

end
