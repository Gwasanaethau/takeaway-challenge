require 'printer'

# class PrinterTest
#   include Printer
# end

describe Printer do
  
  it 'shows hamburger as the only item' do
    menu = double(:menu, dishes: { 'hamburger' => 5})
    expect(subject.show menu).to eq 'hamburger: €5'
  end

  it 'shows cheeseburger as the only item' do
    menu = double(:menu, dishes: { 'cheeseburger' => 5.5 })
    expect(subject.show menu).to eq 'cheeseburger: €5.5'
  end

  it 'shows hamburger and cheeseburger' do
    menu = double(:menu, dishes: { 'hamburger' => 5, 'cheeseburger' => 5.5 })
    expect(subject.show menu).to eq "hamburger: €5\ncheeseburger: €5.5"
  end

end