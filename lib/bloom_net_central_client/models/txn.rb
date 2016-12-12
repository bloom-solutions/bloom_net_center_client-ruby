module BloomNetCentralClient
  class Txn

    include Virtus.model
    attribute :id, String
    attribute :ref_no, String
    attribute :status, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String

  end
end
