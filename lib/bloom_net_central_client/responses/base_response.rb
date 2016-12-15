module BloomNetCentralClient
  class BaseResponse

    include APIClientBase::Response.module
    attribute(:body, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_body,
    })
    attribute :success, Boolean, lazy: true, default: :default_success

    private

    def default_body
      JSON.parse(raw_response.body)
    end

  end
end
