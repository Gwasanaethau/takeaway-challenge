# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
feature 'customer can see a list of dishes with prices' do
  scenario 'which includes a hamburger' do
    menu = Menu.new
    menu.add 'hamburger', 5
    expect(Printer.show menu).to eq 'hamburger: €5'
  end

  scenario 'which includes a cheeseburger' do
    menu = Menu.new
    menu.add 'cheeseburger', 5.5
    expect(Printer.show menu).to eq 'cheeseburger: €5.5'
  end
end
