require 'test/unit'
require_relative 'transaction.rb'
require_relative 'bank.rb'

class TransactionTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @a_Transaction = Transaction.new(0, 100)
  end

  def test_process_transaction
    a_bank = Bank.new
    a_bank.add_account(0)
    @a_Transaction.process_transaction(a_bank)
  end
end