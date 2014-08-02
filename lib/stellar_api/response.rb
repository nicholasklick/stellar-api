module StellarApi
  class Response

    attr_accessor :result

    def initialize(hash)
      @result = hash['result']
    end 

    def status
      result['status']
    end

    def validated
      result['validated']
    end

  end

end