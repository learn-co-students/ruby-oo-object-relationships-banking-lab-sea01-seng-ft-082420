require 'pry'
class BankAccount
    attr_reader :name
    attr_accessor :account, :balance, :status
    
    def initialize(name)
        @name= name
        @balance= balance = 1000
        @status= status = 'open'
    end

    def deposit(money)
        self.balance += money
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" and @balance > 0
            TRUE
        else
            FALSE
        end
    end

    def close_account
        @status = "closed"
    end
end





=begin
BankAccount
  #initialize
    can initialize a Bank Account (FAILED - 1)
    initializes with a name (FAILED - 2)
    always initializes with balance of 1000 (FAILED - 3)
    always initializes with a status of 'open' (FAILED - 4)
    can't change its name (FAILED - 5)
  #deposit
    can deposit money into its account (FAILED - 6)
  #display_balance
    can display its balance (FAILED - 7)
  #valid?
    is valid with an open status and a balance greater than 0 (FAILED - 8)
  #close_account
    can close its account (FAILED - 9)

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
