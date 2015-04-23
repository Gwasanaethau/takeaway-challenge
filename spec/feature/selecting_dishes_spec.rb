# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require 'customer'

feature 'customer can select from a list of dishes' do
  before(:each) do
    @menu = Menu.new
    @customer = Customer.new @menu
  end

  scenario 'select a hamburger' do
    @menu.add 'hamburger', 5
    expect(@customer.choose 'hamburger').to eq '1× hamburger'
  end

  scenario 'select a cheeseburger' do
    @menu.add 'cheeseburger', 5.5
    expect(@customer.choose 'cheeseburger').to eq '1× cheeseburger'
  end

  scenario 'cannot select an item off the menu' do
    @menu.add 'hamburger', 5
    expect { @customer.choose 'cheeseburger' }.to raise_error
  end

  scenario 'select a hamburger and a cheeseburger' do
    @menu.add 'hamburger', 5
    @menu.add 'cheeseburger', 5.5
    expect(@customer.choose 'cheeseburger').to eq '1× cheeseburger'
    expect(@customer.choose 'hamburger').to eq '1× cheeseburger, 1× hamburger'
  end

  scenario 'select two hamburgers' do
    @menu.add 'hamburger', 5
    expect(@customer.choose 'hamburger', 2).to eq '2× hamburger'
  end
end
