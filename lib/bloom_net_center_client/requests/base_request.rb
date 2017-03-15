module BloomNetCenterClient
  class BaseRequest

    include APIClientBase::Request.module
    attribute(:headers, Coercers::IndifferentHash, {
      lazy: true,
      default: :default_headers,
    })

    private

    def default_headers
      {"Content-Type" => "application/json"}
    end

  end
end
