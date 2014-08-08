require "rspec"
require 'pg'
require 'doctor'
require 'patient'
require 'pry'

DB = PG.connect({:dbname => 'drs_office'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors * ;")
  end
end

describe Doctor do
  before do
    @test_doctor = Doctor.new({'name' => 'Tom Baker', 'specialty_id' => 1, 'insurance_id' => 1})
  end

  it "will initialize a doctor class" do
    expect(@test_doctor).to be_an_instance_of Doctor
  end

  it "should return each attribute when asked" do
    expect(@test_doctor.name).to eq ('Tom Baker')
    expect(@test_doctor.specialty_id).to eq (1)
    expect(@test_doctor.insurance_id).to eq (1)
  end

end