class Customer
  attr_reader :menu, :choices

  def initialize menu
    @choices = []
    @menu = menu
  end

  def choose dish, quantity = 1
    fail unless menu.dishes[dish]
    choices << "#{quantity}× #{dish}"
    choices.join(", ")
  end

end

