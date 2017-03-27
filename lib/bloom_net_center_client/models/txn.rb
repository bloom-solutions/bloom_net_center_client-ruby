module BloomNetCenterClient
  class Txn

    include Virtus.model
    attribute :id, String
    attribute :status, String
    attribute :sender_first_name, String
    attribute :sender_last_name, String
    attribute :sender_street, String
    attribute :sender_city, String
    attribute :sender_province, String
    attribute :sender_contact_number, String
    attribute :recipient_first_name, String
    attribute :recipient_last_name, String
    attribute :recipient_street, String
    attribute :recipient_city, String
    attribute :recipient_province, String
    attribute :recipient_contact_number, String
    attribute :amount, BigDecimal
    attribute :account, String
    attribute :currency, String

    ATTRS = self.attribute_set.map(&:name)

  end
end
