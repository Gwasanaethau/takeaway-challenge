# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'customer'

feature 'customer can select from a list of dishes' do
  let!(:menu) { Menu.new }
  let!(:customer) { Customer.new menu }

  scenario 'select a hamburger' do
    menu.add 'hamburger', 5
    customer.choose 'hamburger'
    expect(customer.choices).to include('hamburger' => [1, 5])
  end

  scenario 'select a cheeseburger' do
    menu.add 'cheeseburger', 5.5
    customer.choose 'cheeseburger'
    expect(customer.choices).to include('cheeseburger' => [1, 5.5])
  end

  scenario 'cannot select an item not on the menu' do
    menu.add 'hamburger', 5
    expect { customer.choose 'cheeseburger' }.to raise_error
  end

  scenario 'select a hamburger and a cheeseburger' do
    menu.add 'hamburger', 5
    menu.add 'cheeseburger', 5.5
    customer.choose 'cheeseburger'
    expect(customer.choices).to include('cheeseburger' => [1, 5.5])
    customer.choose 'hamburger'
    expect(customer.choices).to include('cheeseburger' => [1, 5.5], 'hamburger' => [1, 5])
  end

  scenario 'select two hamburgers' do
    menu.add 'hamburger', 5
    customer.choose 'hamburger', 2
    expect(customer.choices).to include('hamburger' => [2, 5])
  end
end
