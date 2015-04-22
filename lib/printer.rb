module Printer
  def self.show menu
    menu.dishes.each.inject('') do |text, (dish, price)|
      text += "#{dish}: €#{price}"
    end
  end
end
