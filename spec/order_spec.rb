require 'order'
# require 'customer'

describe Order do
  # let!(:subject) { described_class.new(double :customer) }

  # it { is_expected.to respond_to(:sum_total) }

  it 'sums up to €5 when a hamburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'hamburger' => 1 })
    order = described_class.new(customer)
    expect(order.sum_total).to eq 5
  end

  it 'sums up to €5.50 when a cheeseburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'cheeseburger' => 1 })
    order = described_class.new(customer)
    expect(order.sum_total).to eq 5.5
  end

  it 'sums up to €10.50 when a cheeseburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'cheeseburger' => 1, 'hamburger' => 1 })
    order = described_class.new(customer)
    expect(order.sum_total).to eq 10.5
  end
end
