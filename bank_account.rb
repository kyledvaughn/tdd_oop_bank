# CLASS FILE bank_account.rb

class BankAccount
    attr_reader :balance
    @@minimum_balance = 200
    @@overdraft = 50
    
    def initialize(balance, name)
        if balance < @@minimum_balance
            raise ArgumentError
        end
        @balance = balance
        @name = name
    end
    
    def deposit(amount)
        @balance += amount
    end
    
    def withdrawl(amount)
        @balance -= amount
    end
    
    def transfer(amount, bank_account)
        withdrawl(amount)
        bank_account.deposit(amount)
    end
    
    def self.minimum_balance(amount)
        @@minimum_balance = amount
    end
    
    def overdraft
        if @balance < 0
           withdrawl(@@overdraft)
        end
    end
        
end
    
