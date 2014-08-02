module StellarApi
  class Account < Base

    attr_accessor :account_id

    # Accepts account_id
    def initialize(account_id)
      @account_id = account_id

      super()
    end

    def currencies(ledger_index='current')
      params = build_params({ ledger_index: ledger_index })
      build_response(:account_currencies, params)
    end

    def info(ledger_index='current')
      params = build_params({ ledger_index: ledger_index })
      build_response(:account_info, params)
    end

    def lines(ledger_index='current', ledger_hash=nil, peer=nil)
      params = build_params({ ledger_index: ledger_index })
      params.merge(ledger_hash: ledger_hash) if ledger_hash
      params.merge(peer: peer) if peer
      build_response(:account_lines, params)
    end

    def offers(options={})
      params = build_params(options)
      build_response(:account_offers, params)
    end

    def transaction(ledger_min=0, ledger_max=-1, options={})
      params = build_params({ledger_min: ledger_min, ledger_max: ledger_max}.merge(options))
      build_response(:account_tx, params)
    end

    private

    def build_params(options)
      { account: account_id }.merge(options)
    end

  end

end