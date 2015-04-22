require 'menu'

describe Menu do
  it { is_expected.to respond_to(:add).with(2).arguments }
  it { is_expected.to respond_to(:show) }

  it 'shows hamburger as the only item' do
    subject.add 'hamburger', 5
    expect(subject.show).to eq 'hamburger: €5'
  end

  it 'shows cheeseburger as the only item' do
    subject.add 'cheeseburger', 5.5
    expect(subject.show).to eq 'cheeseburger: €5.5'
  end

  it 'allows the hamburger to be chosen' do
    subject.add 'hamburger', 5
    expect(subject.choose "hamburger").to eq "1× hamburger"
  end

  it 'allows the cheeseburger to be chosen' do
    subject.add 'cheeseburger', 5.5
    expect(subject.choose "cheeseburger").to eq "1× cheeseburger"
  end

  it 'does not allow items off the menu to be chosen' do
    subject.add 'hamburger', 5
    expect { subject.choose "cheeseburger" }.to raise_error
  end

  it 'recognizes that cheeseburger and hamburger were chosen' do
    subject.add 'cheeseburger', 5.5
    subject.add 'hamburger', 5
    expect(subject.choose "cheeseburger").to eq "1× cheeseburger"
    expect(subject.choose "hamburger").to eq "1× cheeseburger, 1× hamburger"
  end

  it 'allows two hamburgers to be chosen' do
    subject.add 'hamburger', 5
    expect(subject.choose "hamburger", 2).to eq "2× hamburger"
  end

end
