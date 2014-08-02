require_relative 'spec_helper'

describe StellarApi do

  let(:account_id){ "ganVp9o5emfzpwrG5QVUXqMv8AgLcdvySb" }
  let(:base_uri){ "https://test.stellar.org:9002" }

  describe StellarApi::Client do

    before :all do 
      @client = StellarApi::Client
    end

    it "base_uri should be correct uri" do
      @client.base_uri.should == base_uri
    end
  
  end

end