module BloomNetCenterClient
  class Claim

    ATTRS = %i[
      tracking_no
      status
      account
    ]

    include Virtus.model
    attribute :tracking_no, String
    attribute :status, String
    attribute :account, String

  end
end
