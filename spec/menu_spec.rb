require 'menu'


describe Menu do
  it { is_expected.to respond_to(:add).with(2).arguments }
end
