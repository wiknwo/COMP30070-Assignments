require 'test/unit'
require_relative 'teller.rb'
require_relative 'bank.rb'
require_relative 'transaction.rb'

class TellerTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    a_bank = Bank.new
    @a_Teller = Teller.new('Dan', a_bank, 1)
  end

  def test_process_transaction
    @a_Teller.process_transaction(Transaction.new(0, 100))
  end

end