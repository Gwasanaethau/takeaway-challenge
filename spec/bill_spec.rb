require 'bill'

describe Bill do
  it 'sums up to €5 when a hamburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'hamburger' => [1, 5] })
    expect(subject.sum_total customer).to eq 5
  end

  it 'sums up to €5.50 when a cheeseburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'cheeseburger' => [1, 5.5] })
    expect(subject.sum_total customer).to eq 5.5
  end

  it 'sums up to €10.50 when a hamburger and a cheeseburger is chosen' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    customer = double(:customer, menu: menu, choices: { 'cheeseburger' => [1, 5.5],
                                                        'hamburger' => [1, 5] })
    expect(subject.sum_total customer).to eq 10.5
  end
end
