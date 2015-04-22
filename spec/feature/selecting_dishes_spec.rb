# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

feature 'customer can select from a list of dishes' do
  scenario 'select a hamburger' do
    menu = Menu.new
    menu.add "hamburger", 5
    expect(menu.choose "hamburger").to eq "hamburger"
  end

  scenario 'select a cheeseburger' do
    menu = Menu.new
    menu.add "cheeseburger", 5.5
    expect(menu.choose "cheeseburger").to eq "cheeseburger"
  end

  scenario 'cannot select an item off the menu' do
    menu = Menu.new
    menu.add "hamburger", 5
    expect { menu.choose "cheeseburger" }.to raise_error
  end

  scenario 'select a hamburger and a cheeseburger' do
    menu = Menu.new
    menu.add "hamburger", 5
    menu.add "cheeseburger", 5.5
    expect(menu.choose "cheeseburger").to eq "cheeseburger"
    expect(menu.choose "hamburger").to eq "cheeseburger, hamburger"
  end

end