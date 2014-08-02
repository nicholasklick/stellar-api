require "httparty"

module StellarApi

  class Client

    include HTTParty

    base_uri "https://test.stellar.org:9002"

  end

end


