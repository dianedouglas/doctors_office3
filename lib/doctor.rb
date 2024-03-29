class Doctor

  attr_reader :name, :specialty_id, :insurance_id, :id

  def initialize(attributes)
    @name = attributes['name']
    @specialty_id = attributes['specialty_id'].to_i
    @insurance_id = attributes['insurance_id'].to_i
    @id = attributes['id'].to_i
  end

  def self.all
    doctors = []
    results = DB.exec("SELECT * FROM doctors;")
    results.each do |result|
      current_doc = Doctor.new(result)
      doctors << current_doc
    end
    doctors
  end

  def save
    results = DB.exec("INSERT INTO doctors (name, specialty_id, insurance_id) VALUES ('#{@name}', '#{@specialty_id}', '#{@insurance_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_doctor)
    (@name == another_doctor.name) && (@specialty_id == another_doctor.specialty_id) && (@insurance_id == another_doctor.insurance_id) && (@id == another_doctor.id)
  end

  def assign_to_patient(patient)
    DB.exec("UPDATE patients SET doctor_id = '#{@id}' WHERE id = '#{patient.id}';")
  end

  def change_specialty(specialty)
    results = DB.exec("UPDATE doctors SET specialty_id = '#{specialty.id}' WHERE id = '#{@id}' RETURNING specialty_id;")
    @specialty_id = results.first['specialty_id'].to_i
  end

end
