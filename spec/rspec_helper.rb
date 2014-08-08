require "rspec"
require 'pg'
require 'doctor'
require 'patient'
require 'specialty'
require 'pry'

DB = PG.connect({:dbname => 'drs_office'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors * ;")
    DB.exec("DELETE FROM patients * ;")
    DB.exec("DELETE FROM specialties;")
  end
end

def setup
  @test_doctor = Doctor.new({'name' => 'Tom Baker', 'specialty_id' => 1, 'insurance_id' => 1})
  @test_doctor2 = Doctor.new({'name' => 'Tom Baker', 'specialty_id' => 1, 'insurance_id' => 1})
  @test_patient = Patient.new({'name' => 'Bom Taker', 'birthdate' => '1999-03-02'})
  @test_specialty = Specialty.new({'name' => 'pediatrics'})
end
