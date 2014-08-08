require 'rspec_helper'

describe Doctor do
  before do
    setup
  end

  it "will initialize a doctor class" do
    expect(@test_doctor).to be_an_instance_of Doctor
  end

  it "should return each attribute when asked" do
    expect(@test_doctor.name).to eq ('Tom Baker')
    expect(@test_doctor.specialty_id).to eq (1)
    expect(@test_doctor.insurance_id).to eq (1)
  end

  it "should return all doctors stored in the doctor table" do
    expect(Doctor.all).to eq []
  end

  it "should save the doctor to the doctor table" do
    @test_doctor.save
    expect(Doctor.all).to eq [@test_doctor]
  end

  it "should return true if two doctors have all the same attributes." do
    @test_doctor.save
    expect(@test_doctor==@test_doctor).to eq true
  end

end
