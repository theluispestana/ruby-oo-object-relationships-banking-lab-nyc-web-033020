#require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status 
  def initialize(sender, receiver, amount)
    @amount = amount 
    @sender = sender 
    @receiver = receiver
    @status = "pending"
  end 

  def valid?
   @sender.valid? && @receiver.valid? 
  end 

 def execute_transaction 
  if @status != "pending" 
    return "Rejected"
  end 
    if @sender.valid? && @sender.balance > @amount && @receiver.valid?
      #binding.pry 
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
     else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
     end 
 end 
   
 def reverse_transfer 
  return "failed" if @status != "complete"
  @sender.balance += @amount 
  @receiver.balance -= @amount 
  @status = "reversed"
 end 


end
 