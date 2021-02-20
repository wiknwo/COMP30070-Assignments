require 'test/unit'
require_relative 'account.rb'

class AccountTest < Test::Unit::TestCase
  def setup
    @an_account = Account.new(0)
  end

end