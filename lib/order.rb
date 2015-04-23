class Order
  attr_reader :dishes

  def initialize customer
    @dishes = customer.choices
  end

  def sum_total
    dishes.inject(0) do |sum, (dish, quantity_and_price)|
      sum += quantity_and_price.inject(&:*)
    end
  end
end
