require 'rspec_helper'

describe Insurance do
  before do
    setup
  end


  it 'will initialize an insurance object' do
    expect(@test_insurance).to be_an_instance_of Insurance
    expect(@test_insurance.name).to eq 'Health Cross'
  end

end
