class Patient

  attr_reader :name, :birthdate, :doctor_id, :id

  def initialize(attributes)
    @name = attributes['name']
    @birthdate = attributes['birthdate'].split(" ")[0]
    @id = attributes['id'].to_i
    @doctor_id = attributes['doctor_id'].to_i
  end

  def self.all
    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each do |result|
      current_patient = Patient.new(result)
      patients << current_patient
    end
    patients
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthdate, doctor_id) VALUES ('#{@name}', '#{@birthdate}', '#{@doctor_id}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(patient)
    @name==(patient.name) && @birthdate==(patient.birthdate) && @id==(patient.id)
  end

  def get_doctor
    doctor_for_this_patient = nil

    results = DB.exec("SELECT * FROM patients WHERE id = '#{@id}';")
    results.each do |patient|
      @doctor_id = patient['doctor_id']
    end

    results = DB.exec("SELECT * FROM doctors WHERE id = '#{@doctor_id}';")
    results.each do |doctor|
      doctor_for_this_patient = Doctor.new(doctor)
    end

    doctor_for_this_patient
  end
end
