# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the
#   various dishes in my order

feature 'customer can verify the order total' do
  scenario 'when ordering a hamburger' do
    menu = Menu.new
    menu.add 'hamburger', 5
    customer = Customer.new menu
    customer.choose 'hamburger'
    order = Order.new customer
    expect(order.sum_total).to eq 5
  end

  scenario 'when ordering a cheeseburger' do
    menu = Menu.new
    menu.add 'cheeseburger', 5.5
    customer = Customer.new menu
    customer.choose 'cheeseburger'
    order = Order.new customer
    expect(order.sum_total).to eq 5.5
  end
end
