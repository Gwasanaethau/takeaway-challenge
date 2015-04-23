require 'printer'

describe Printer do

  it 'shows hamburger as the only item' do
    menu = double(:menu, dishes: { 'hamburger' => 5 })
    expect(subject.show_menu menu).to eq 'hamburger: €5'
  end

  it 'shows cheeseburger as the only item' do
    menu = double(:menu, dishes: { 'cheeseburger' => 5.5 })
    expect(subject.show_menu menu).to eq 'cheeseburger: €5.5'
  end

  it 'shows hamburger and cheeseburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    expect(subject.show_menu menu).to eq "hamburger: €5\ncheeseburger: €5.5"
  end

  it 'can choose a hamburger' do
    order = double(:order, dishes: { 'hamburger' => [1, 5] })
    expect(subject.show_order order).to eq "1× hamburger"
  end

  it 'can choose a cheeseburger' do
    order = double(:order, dishes: { 'cheeseburger' => [1, 5.5] })
    expect(subject.show_order order).to eq "1× cheeseburger"
  end

  it 'can choose a cheeseburger and a hamburger' do
    order = double(:order, dishes: { 'hamburger' => [1, 5], 'cheeseburger' => [1, 5.5] })
    expect(subject.show_order order).to eq "1× hamburger\n1× cheeseburger"
  end

  it 'can choose two hamburgers' do
    order = double(:order, dishes: { 'hamburger' => [2, 5] })
    expect(subject.show_order order).to eq "2× hamburger"
  end
end
