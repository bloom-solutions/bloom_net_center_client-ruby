module BloomNetCenterClient
  class BaseRequest

    include APIClientBase::Request.module
    attribute(:headers, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_headers,
    })
    attribute :body, String, lazy: true, default: :default_body
    attribute :token, String
    attribute :secret, String
    attribute :signature, String, lazy: true, default: :default_signature

    private

    def default_headers
      {
        "Content-Type" => "application/vnd.api+json",
        "Accept" => "application/vnd.api+json",
        "Authorization" => "HMAC-SHA256 #{token}:#{signature}",
      }
    end

    def default_signature
      OpenSSL::HMAC.hexdigest("SHA256", secret, body)
    end

  end
end
