require 'rspec_helper'

describe Patient do
  before do
    setup
  end

  it "initialize a Patient object" do
    expect(@test_patient).to be_an_instance_of Patient
  end

  it "will return values for name, birthday and id when asked." do
    expect(@test_patient.name).to eq 'Bom Taker'
    expect(@test_patient.birthdate).to eq '1999-03-02'
  end

  it "should return all stored patients - initially none." do
    expect(Patient.all).to eq []
  end

  it "should save a patient to the patients table" do
    @test_patient.save
    expect(Patient.all).to eq [@test_patient]
  end

  it "should return true if two patients are the same" do
    @test_patient.save
    expect(@test_patient==@test_patient).to eq true
  end

end
