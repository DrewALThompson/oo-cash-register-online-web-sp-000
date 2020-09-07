class CashRegister
  
  attr_accessor :items, :total, :discount, :last_transaction_amount
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
    @last_transaction_amount = 0
  end
  
  def add_item(title, price, quantity = 1)
    quantity.times do 
      @items << title
    end
    @total += price * quantity
    @last_transaction_amount = @total
  end
  
  def apply_discount
    if @discount > 0
      @discount = @discount/100.to_f
      @total = (@total - (@total * @discount)).to_i
      return "After the discount, the total comes to $#{@total}."
    else
      @discount <= 0
      return"There is no discount to apply."
    end
  end
  
  def void_last_transaction
    self.total = self.total - self.last_transaction_amount
  end
      
end