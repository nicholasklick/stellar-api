module StellarApi
  class Transaction < Base

    attr_accessor :account, :secret

    def initialize(secret)
      @secret = secret
      @account = account
      super()
    end

    def sign(destination, amount={})
      tx_hash = build_tx_hash("Payment", amount, {"Destination" => destination})
      hash = {
        command: 'sign',
        secret: secret,
        tx_json: tx_hash
      }
      post_custom(params)
    end

    def payment(destination, amount={})
      tx_json = build_tx_hash("Payment", amount, {"Destination" => destination})
      build_response(:submit, { 
        secret: secret,
        tx_json: tx_hash
      })
    end

    def offer_create(amount, taker_gets={}, taker_pays={})
      taker_hash = taker_gets.merge(taker_pays)
      tx_hash = build_tx_hash("OfferCreate", amount, taker_hash)
      build_response(:submit, { 
        secret: secret,
        tx_json: tx_hash
      })
    end

    private

    def build_tx_hash(type, amount, options={})
      hash = {
        "TransactionType" => type,
        "Account" => account,
        "Amount" => {
          currency: amount[:currency],
          value: amount[:value],
          issuer: amount[:issuer]
        }
      }
      hash.merge(options)
    end

  end

end