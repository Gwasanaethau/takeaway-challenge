class Order
  attr_reader :customer

  def initialize customer
    @customer = customer
  end

  def sum_total
    customer.choices.inject(0) do |sum, (dish, quantity)|
      sum += quantity * customer.menu.dishes[dish]
    end
  end
end
