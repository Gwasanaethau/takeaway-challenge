require 'menu'
require 'printer'

describe Menu do
  it { is_expected.to respond_to(:add).with(2).arguments }
  # it { is_expected.to respond_to(:show) }

  it 'shows hamburger as the only item' do
    subject.add 'hamburger', 5
    expect(Printer.show subject).to eq 'hamburger: €5'
  end

  it 'shows cheeseburger as the only item' do
    subject.add 'cheeseburger', 5.5
    expect(Printer.show subject).to eq 'cheeseburger: €5.5'
  end
end
