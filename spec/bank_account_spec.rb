#TEST FILE bank_account_spec.rb
require "./bank_account.rb"

describe BankAccount do    
    it "is created with an opening balance and the name of a client" do
        account = BankAccount.new(500, "Sarah")
        expect(account).to be_a(BankAccount)
    end
    
    it "can report it's balance" do
        account = BankAccount.new(500, "Sarah")
        expect(account.balance).to eq(500)
    end
    
    it "can make deposits" do
        account = BankAccount.new(500, "Sarah")
        account.deposit(500) 
        expect(account.balance).to eq(1000)
    end
    
    it "can make withdrawls" do
        account = BankAccount.new(500, "Sarah")
        account.withdrawl(200)
        expect(account.balance).to eq(300)
    end
    
    it "can transfer funds to another bank account" do
        account1 = BankAccount.new(500, "Sarah")
        account2 = BankAccount.new(500, "Kyle")
        account1.transfer(100, account2)
        expect(account1.balance).to eq(400)
        expect(account2.balance).to eq(600)
    end
    
    it "has a minimum opening balance" do
        expect{BankAccount.new(199, "Sarah")}.to raise_error(ArgumentError)
    end
    
    it "allows the bank to change the minimum balance" do
        BankAccount.minimum_balance(250)
        expect{BankAccount.new(230, "Sarah")}.to raise_error(ArgumentError)
        expect{BankAccount.new(300, "Kyle")}.to_not raise_error(ArgumentError)
    end
    
    it "charges the account an overdraft fee if the balance is less than zero" do
        account1 = BankAccount.new(500, "Sarah")
        account2 = BankAccount.new(500, "Kyle")
        account1.transfer(600, account2)
        expect(account1.balance).to eq(-150)
        expect(account2.balance).to eq(1100)
    end
    
end




















