require 'rspec_helper'

describe Specialty do
  before do
    setup
  end

  it 'will initialize a specialty' do
    expect(@test_specialty).to be_an_instance_of Specialty
    expect(@test_specialty.name).to eq "pediatrics"
  end

  it 'will save to the database.' do
    expect(Specialty.all).to eq [@test_specialty]
  end

  it 'will return the doctors with a specified specialty' do
    @test_doctor.save
    @test_doctor2.save
    @test_doctor3.save
    expect(@test_specialty.specialty_sort).to eq [@test_doctor, @test_doctor2, @test_doctor3]
  end
end
