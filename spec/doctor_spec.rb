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
    expect(@test_doctor.specialty_id).to eq (@test_specialty.id)
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

  it 'should assign the current doctor to the given patient.' do
    @test_patient.save
    @test_doctor.save
    @test_doctor.assign_to_patient(@test_patient)
    expect(@test_patient.get_doctor).to eq @test_doctor
  end

  it "will update the specialty of the doctor" do
    @test_doctor.save
    @new_specialty = Specialty.new('fireworks')
    @new_specialty.save
    @test_doctor.change_specialty(@new_specialty)
    expect(@test_doctor.specialty_id).to eq @new_specialty.id
  end

end
