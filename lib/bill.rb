module Bill
  def self.sum_total customer
    customer.choices.inject(0) do |sum, (_dish, quantity_and_price)|
      sum += quantity_and_price.inject(&:*)
    end
  end
end
