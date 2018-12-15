class BankAccount

  attr_accessor :balance, :status
  attr_reader :name

  @@all = []
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"

    @@all << self
  end

  def self.all
    @@all
  end

  ## ----------------- End of Class methods ------------------------

  ## ----------------- start of instance methods ------------------------

  def deposit(increase_amount)
    @balance += increase_amount
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

end # end of Bank class
