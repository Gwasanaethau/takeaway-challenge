require 'customer'

describe Customer do

  it 'does not allow items off the menu to be chosen' do
    menu = double(:menu, dishes: {"hamburger" => 5})
    expect { described_class.new(menu).choose "cheeseburger" }.to raise_error
  end

  it 'allows the hamburger to be chosen' do
    menu = double(:menu, dishes: {"hamburger" => 5})
    expect(described_class.new(menu).choose "hamburger").to eq "1× hamburger"
  end

  it 'allows the cheeseburger to be chosen' do
    menu = double(:menu, dishes: {"cheeseburger" => 5.5})
    expect(described_class.new(menu).choose "cheeseburger").to eq "1× cheeseburger"
  end 

  it 'recognizes that cheeseburger and hamburger were chosen' do
    menu = double(:menu, dishes: {"hamburger" => 5, "cheeseburger" => 5.5})
    customer = described_class.new(menu)
    expect(customer.choose "cheeseburger").to eq "1× cheeseburger"
    expect(customer.choose "hamburger").to eq "1× cheeseburger, 1× hamburger"
  end

  it 'allows two hamburgers to be chosen' do
    menu = double(:menu, dishes: {"hamburger" => 5})
    expect(described_class.new(menu).choose "hamburger", 2).to eq "2× hamburger"
  end

end