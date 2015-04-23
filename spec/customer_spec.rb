require 'customer'

describe Customer do
  it 'cannot choose items not on the menu' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    expect { described_class.new(menu).choose 'cheeseburger' }.to raise_error
  end

  it 'can choose a hamburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    expect(described_class.new(menu).choose 'hamburger').to eq '1× hamburger'
  end

  it 'can choose a cheeseburger' do
    menu = double(:menu, dishes: { 'cheeseburger' => 5.5 })
    expect(described_class.new(menu).choose 'cheeseburger')
      .to eq '1× cheeseburger'
  end

  it 'can choose a cheeseburger and a hamburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = described_class.new(menu)
    expect(customer.choose 'cheeseburger').to eq '1× cheeseburger'
    expect(customer.choose 'hamburger').to eq '1× cheeseburger, 1× hamburger'
  end

  it 'can choose two hamburgers' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    expect(described_class.new(menu).choose 'hamburger', 2).to eq '2× hamburger'
  end
end
