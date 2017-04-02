class BankAccount

  @@interest_rate
  @@acounts = []

  attr_accessor :balance

  def initialize (balance)
    @balance = 0
  end

end
