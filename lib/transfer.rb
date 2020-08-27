require 'pry'

class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @status = 'pending'
  @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if self.sender.balance >= self.amount && self.status == 'pending' && self.valid?
    self.sender.balance -= self.amount
    self.receiver.balance += self.amount
    self.status = 'complete'
    else
      self.status = 'rejected'
      pp "Transaction rejected. Please check your account balance."
    end 
    
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = 'reversed'
    end
  end

end
