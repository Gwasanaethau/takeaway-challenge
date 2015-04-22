class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add dish, price
    dishes[dish] = price
  end

end
