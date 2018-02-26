require './transaction'

class Account

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @balance = starting_balance
    @transactions = []
    @transaction_class = transaction_class
  end

  def balance
    @balance.dup
  end

  def transactions
    @transactions.dup
  end

  def withdraw(amount)
    @balance -= amount
    withdrawal = @transaction_class.new(-amount, @balance, DateTime.now)
    store_transaction(withdrawal)
  end

  def deposit(amount)
    @balance += amount
    deposit = @transaction_class.new(amount, @balance, DateTime.now)
    store_transaction(deposit)
  end

  private_class_method

  def store_transaction(transaction)
    @transactions << transaction
  end

end