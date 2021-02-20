class Transaction
  def initialize(id, amount)
    @acc_id = id
    self.amount = amount # Delegate initialization to setter method
  end

  def amount=(amount)
    if amount == 0
      raise ArgumentError.new('Amount must be non-zero.')
    end
    @amount = amount
  end

  def process_transaction(bank)
    if @amount > 0
      bank.deposit(@acc_id, @amount)

    elsif @amount < 0
      bank.withdraw(@acc_id, @amount * -1)
    end
  end
end