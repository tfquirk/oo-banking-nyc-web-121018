class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

    @@all << self
  end

  def self.all
    @@all
  end

  ## ----------------- End of Class methods ------------------------

  ## ----------------- start of instance methods ------------------------

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance - @amount > 0
  end

  def execute_transaction

    if self.valid? == true
      if @status != "complete"
        @sender.balance -= @amount
        @receiver.deposit(@amount)
        @status = "complete"
      end
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
    end
    @status = "reversed"
  end

end
