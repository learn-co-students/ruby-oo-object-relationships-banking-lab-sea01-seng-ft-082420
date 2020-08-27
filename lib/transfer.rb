require 'pry'
class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount 
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount 
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject
    end
  end

  def reject
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete" && valid? && receiver.balance > amount 
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject
    end
  end



#binding.pry 
0 
end
