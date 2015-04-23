module Printer
  def self.show_menu menu
    menu.dishes.each.inject('') do |text, (dish, price)|
      text += "#{dish}: €#{price}\n"
    end.chomp
  end

  def self.show_order order
    order.dishes.each.inject('') do |text, (dish, quantity)|
      text += "#{quantity}× #{dish}\n"
    end.chomp
  end
end
