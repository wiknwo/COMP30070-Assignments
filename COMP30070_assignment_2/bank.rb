# A Bank comprises a number of accounts
require_relative 'account.rb'
class Bank
  def initialize
    @bank_accounts = {}
    @bank_tellers = []
  end

  def add_account(id)
    @bank_accounts[id] = Account.new(id)
  end

  def deposit(id, amount)
    @bank_accounts[id].deposit(amount)
  end

  def withdraw(id, amount)
    @bank_accounts[id].withdraw(amount)
  end

  def add_teller(teller)
    @bank_tellers << teller
  end

  def process_transactions_randomly(arr_of_transactions)
    arr_of_transactions.each do |transaction|
      choice = rand(@bank_tellers.length)
      @bank_tellers[choice].process_transaction(transaction)
    end
  end

  # The goal is to minimise the maximum time any teller spends processing
  # transactions.
  def process_transactions_smartly(arr_of_transactions)
  #  arr_of_transactions.each_with_index do |transaction, index|
  #    @bank_tellers[index % @bank_tellers.length].process_transaction(transaction)
  #  end
    i = 0
    while i < arr_of_transactions.length / 2
      @bank_tellers[0].process_transaction(arr_of_transactions[i])
      i += 1
    end

    while i < (arr_of_transactions.length * 0.33) + (arr_of_transactions.length / 2)
      @bank_tellers[1].process_transaction(arr_of_transactions[i])
      i += 1
    end

    while i < arr_of_transactions.length
      @bank_tellers[2].process_transaction(arr_of_transactions[i])
      i += 1
    end
  end

  def to_s
    output_str = ""
    @bank_accounts.each {|key, value| output_str += value.to_s}
    @bank_tellers.each {|teller| output_str += teller.to_s}
    output_str
  end
end