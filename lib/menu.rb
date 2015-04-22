class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add dish, price
    dishes[dish] = price
  end

  def show
    dishes.each.inject('') do |text, (dish, price)|
      text += "#{dish}: €#{price}"
    end
  end
end
