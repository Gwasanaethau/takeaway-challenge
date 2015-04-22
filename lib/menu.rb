class Menu
  attr_reader :dishes, :choices

  def initialize
    @dishes = {}
    @choices = []
  end

  def add dish, price
    dishes[dish] = price
  end

  def show
    dishes.each.inject('') do |text, (dish, price)|
      text += "#{dish}: €#{price}"
    end
  end

  def choose dish, quantity = 1
    fail unless dishes[dish]
    choices << "#{quantity}× #{dish}"
    choices.join(", ")
  end
end
