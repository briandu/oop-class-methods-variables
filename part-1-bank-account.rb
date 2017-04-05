class BankAccount

  attr_accessor :balance

  @@interest_rate = 1.05
  @@accounts = []

  def initialize
    @balance = 0
  end

  def deposit(number)
    @balance = @balance + number
  end

  def withdraw(number)
    @balance = @balance - number
  end

  def self.create
     account = BankAccount.new
     @@accounts << account
     return account
  end

  def self.total_funds
    total = 0
      @@accounts.each do |acc|
        total += acc.balance
      end
    total
  end

  def self.interest_time
    @@accounts.each do |acc|
      acc.balance = (acc.balance * @@interest_rate)
    end
  end

end


=begin

#irb notes

load 'part-1-bank-account.rb'

=end
