require 'test/unit'
require_relative 'bank.rb'
require_relative 'teller.rb'

class BankTest < Test::Unit::TestCase
  def setup
    @a_Bank = Bank.new
  end

  def test_add_account
    @a_Bank.add_account(1)
  end

  def test_add_teller
    @a_Bank.add_teller(Teller.new('Homer', @a_Bank, 1))
  end
end