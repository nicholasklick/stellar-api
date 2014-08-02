module StellarApi
  class Utils < Base

    def initialize
      super()
    end

    def book_offers(taker_gets={}, taker_pays={})
      build_response(:book_offers, { taker_pays: taker_pays, taker_gets: taker_gets })
    end

    def create_keys
      build_response(:create_keys)
    end

    def ledger
      build_response(:ledger)
    end

    def ping
      build_response(:ping)
    end

    def static_path_find(source_account, destination_account, amount)
      build_response(:static_path_find, { 
        source_account: source_account, 
        destination_account: destination_account,
        destination_amount: {
          currency: amount[:currency],
          value: amount[:value],
          issuer: amount[:issuer]
        }
      })
    end

    def tx(transaction_id)
      build_response(:tx, { transaction: transaction_id, taker_gets: taker_gets })
    end

  end

end