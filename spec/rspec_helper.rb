require "rspec"
require 'pg'
require 'doctor'
require 'patient'
require 'specialty'
require 'insurance'
require 'pry'

DB = PG.connect({:dbname => 'drs_office'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors * ;")
    DB.exec("DELETE FROM patients * ;")
    DB.exec("DELETE FROM specialties *;")
    # DB.exec("DELETE FROM insurance_companies *;")
  end
end

def setup
  @test_insurance = Insurance.new({'name' => 'Health Cross'})
  @test_specialty = Specialty.new({'name' => 'pediatrics'})
  @test_specialty.save
  @test_doctor = Doctor.new({'name' => 'Tom Baker', 'specialty_id' => @test_specialty.id, 'insurance_id' => 1})
  @test_doctor2 = Doctor.new({'name' => 'Tom Baker', 'specialty_id' => @test_specialty.id, 'insurance_id' => 1})
  @test_doctor3 = Doctor.new({'name' => 'Ron Tanker', 'specialty_id' => @test_specialty.id, 'insurance_id' => 1})
  @test_patient = Patient.new({'name' => 'Bom Taker', 'birthdate' => '1999-03-02'})
end
