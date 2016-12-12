module BloomNetCentralClient
  class BaseResponse

    include Virtus.model
    attribute :raw_response, Object
    attribute(:body, BloomNetCentralClient::Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })

    private

    def default_body
      JSON.parse(raw_response.body)
    end

  end
end
