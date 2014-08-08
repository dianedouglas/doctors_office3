require 'rspec_helper'

describe Specialty do
  before do
    setup
  end

  it 'will initialize a specialty' do
    expect(@test_specialty).to be_an_instance_of Specialty
    expect(@test_specialty.name).to eq "pediatrics"
  end
end
