require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver
    @amount= amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? and receiver.valid?
      TRUE
    else
      FALSE
    end
  end

  def execute_transaction
    if valid? and amount < sender.balance and self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      rejected
    end
  end

  def rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  
  def reverse_transfer
    if valid? and amount < receiver.balance and self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end




=begin
Transfer
  initialize
    can initialize a Transfer (FAILED - 10)
    initializes with a sender (FAILED - 11)
    initializes with a receiver (FAILED - 12)
    always initializes with a status of 'pending' (FAILED - 13)
    initializes with a transfer amount (FAILED - 14)
  #valid?
    can check that both accounts are valid (FAILED - 15)
    calls on the sender and receiver's #valid? methods (FAILED - 16)
  #execute_transaction
    can execute a successful transaction between two accounts (FAILED - 17)
    each transfer can only happen once (FAILED - 18)
    rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 19)
  #reverse_transfer
    can reverse a transfer between two accounts (FAILED - 20)
    it can only reverse executed transfers (FAILED - 21)
=end
