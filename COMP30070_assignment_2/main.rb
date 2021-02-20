require_relative 'bank.rb'
require_relative 'transaction.rb'
require_relative 'teller.rb'

# Part 1
my_bank = Bank.new
3.times do |i|
  my_bank.add_account(i)
  my_bank.deposit(i, (i + 1) * 200)
  my_bank.withdraw(i, 100)
end
puts "Part 1", my_bank.to_s, "\n"

# Part 2
our_bank = Bank.new
file_acc = File.new('accounts.txt', "r")
while line = file_acc.gets
  our_bank.add_account(line.to_i)
end

file_transactions = File.new('transactions.txt', "r")
while line = file_transactions.gets
  data = line.split
  new_transaction = Transaction.new(data[0].to_i, data[1].to_f)
  new_transaction.process_transaction(our_bank)
end
puts "Part 2", our_bank.to_s, "\n"

# Part 4a
the_bank = Bank.new
my_teller1 = Teller.new('Jack', the_bank, 1)
my_teller2 = Teller.new('Emma', the_bank, 2)
my_teller3 = Teller.new('Paul', the_bank, 3)
the_bank.add_teller(my_teller1)
the_bank.add_teller(my_teller2)
the_bank.add_teller(my_teller3)

file_acc = File.new('accounts.txt', "r")
while line = file_acc.gets
  the_bank.add_account(line.to_i)
end

transactions_arr = []
file_transactions = File.new('transactions.txt', "r")
while line = file_transactions.gets
  data = line.split
  transactions_arr << Transaction.new(data[0].to_i, data[1].to_f)
end
the_bank.process_transactions_randomly(transactions_arr)
puts "Part 4a", the_bank.to_s, "\n"

# Part 4b
smart_bank = Bank.new
my_teller1 = Teller.new('Jack', smart_bank, 1)
my_teller2 = Teller.new('Emma', smart_bank, 2)
my_teller3 = Teller.new('Paul', smart_bank, 3)
smart_bank.add_teller(my_teller1)
smart_bank.add_teller(my_teller2)
smart_bank.add_teller(my_teller3)

file_acc = File.new('accounts.txt', "r")
while line = file_acc.gets
  smart_bank.add_account(line.to_i)
end

transactions_arr = []
file_transactions = File.new('transactions.txt', "r")
while line = file_transactions.gets
  data = line.split
  transactions_arr << Transaction.new(data[0].to_i, data[1].to_f)
end
smart_bank.process_transactions_smartly(transactions_arr)
puts "Part 4b", smart_bank.to_s, "\n"



