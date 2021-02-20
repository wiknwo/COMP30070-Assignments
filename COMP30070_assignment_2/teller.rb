class Teller
  def initialize(name, bank, mins_to_process_transaction)
    @teller_name = name
    @teller_bank = bank
    @mins_to_process_transaction = mins_to_process_transaction
    @transaction_count = 0
  end

  def process_transaction(transaction)
    transaction.process_transaction(@teller_bank)
    @transaction_count += 1
  end

  def to_s
    "Teller #{@teller_name} completed #{@transaction_count} transactions in #{@mins_to_process_transaction * @transaction_count} minutes\n"
  end

end