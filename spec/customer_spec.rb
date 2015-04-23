require 'customer'

describe Customer do
  it 'cannot choose items not on the menu' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    customer = described_class.new(menu)
    expect { customer.choose 'cheeseburger' }.to raise_error
  end

  it 'can choose a hamburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    customer = described_class.new(menu)
    customer.choose 'hamburger'
    expect(customer.choices).to include('hamburger' => [1, 5])
  end

  it 'can choose a cheeseburger' do
    menu = double(:menu, dishes: { 'cheeseburger' => 5.5 })
    customer = described_class.new(menu)
    customer.choose 'cheeseburger'
    expect(customer.choices).to include('cheeseburger' => [1, 5.5])
  end

  it 'can choose a cheeseburger and a hamburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = described_class.new(menu)
    customer.choose 'cheeseburger'
    customer.choose 'hamburger'
    expect(customer.choices).to include('cheeseburger' => [1, 5.5])
    expect(customer.choices).to include('cheeseburger' => [1, 5.5],
                                        'hamburger' => [1, 5])
  end

  it 'can choose two hamburgers' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    customer = described_class.new(menu)
    customer.choose 'hamburger', 2
    expect(customer.choices).to include('hamburger' => [2, 5])
  end
end
