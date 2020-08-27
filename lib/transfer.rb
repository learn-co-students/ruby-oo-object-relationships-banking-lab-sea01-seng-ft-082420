require 'pry'

class Transfer
  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if not_enough_funds?(self.sender) || !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def not_enough_funds?(account)
    account.balance - self.amount < 0
  end

  def reverse_transfer
    if self.status == "complete"
      self.amount = -self.amount
      self.status = "pending"
      self.execute_transaction
      self.amount = -self.amount
      self.status = "reversed"
    end
  end
end
