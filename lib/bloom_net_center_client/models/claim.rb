module BloomNetCenterClient
  class Claim

    include Virtus.model
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :ref_no, String
    attribute :status, String

  end
end
