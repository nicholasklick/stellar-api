require_relative File.expand_path(File.join(File.dirname(__FILE__), 'lib/stellar_api.rb'))

# Accounts

account = StellarApi::Account.new("gM4Fpv2QuHY4knJsQyYGKEHFGw3eMBwc1U")

puts account.currencies(400)
puts account.info
puts account.lines
puts account.offers
puts account.transaction


stellar = StellarApi::Utils.new
puts stellar.create_keys
puts stellar.ledger
puts stellar.ping