module BloomNetCentralClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, Object
    attribute(:body, BloomNetCentralClient::Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :success, Boolean, lazy: true, default: :default_success
    attribute :code, Integer, lazy: true, default: :default_code

    private

    def default_body
      JSON.parse(raw_response.body)
    end

    def default_code
      raw_response.code
    end

  end
end
