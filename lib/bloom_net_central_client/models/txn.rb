module BloomNetCentralClient
  class Txn

    include Virtus.model
    attribute :id, String
    attribute :ref_no, String
    attribute :status, String

  end
end
