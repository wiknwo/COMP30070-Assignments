class Account
  def initialize(acc_id)
    @id = acc_id
    @balance = 0.0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

  def to_s
    "Account #{@id} contains €#{'%.2f' % @balance}\n"
  end
end