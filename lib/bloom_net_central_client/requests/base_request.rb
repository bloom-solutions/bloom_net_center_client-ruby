module BloomNetCentralClient
  class BaseRequest

    include Virtus.model
    attribute :host, String
    attribute :path, String, lazy: true, default: :default_path
    attribute :uri, String, lazy: true, default: :default_uri

    private

    def default_path
      fail "Override me please"
    end

    def default_uri
      uri = URI(host)
      uri.path = path
      uri.to_s
    end

  end
end
