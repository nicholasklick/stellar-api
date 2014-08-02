require 'timeout'
require 'ostruct'

module StellarApi
  class Base

    attr_accessor :client, :response
  
    def initialize
      @client = Client
      @response = nil
    end
  
    def post(method, params)
      request_params = generate_request_params(method, params)
      request_to_stellar(request_params)
    end

    def post_custom(params)
      request_to_stellar(params)
    end

    def request_to_stellar(method=:post, params)
      begin
        Timeout::timeout(30) do
          client.send(method, '/', { body: params.to_json })
        end
      rescue Timeout::Error
        raise Exceptions::StellarAPITimeout, params
      end
    end

    def build_response(method, params=nil)
      response = nil
      response = post(method, params)
      response.parsed_response['result'].inject({}){|h,(k,v)| h[k.to_sym] = v; h}
    end

    # def errored?
    #   response && response.keys?(:error)
    # end

    # def error
    #   return nil unless errored?
    #   os = OpenStruct.new
    #   os.type = response[:error]
    #   os.code = response[:error][:error_code]
    #   os.message = response[:error][:error_message]
    #   os.request = response[:error][:request]
    #   os
    # end

    private

    def generate_request_params(method, params)
      {
        method: method,
        params: [ params ]
      }
    end

  end
end