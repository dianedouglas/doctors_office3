class Patient

  attr_reader :name, :birthdate, :id

  def initialize(attributes)
    @name = attributes['name']
    @birthdate = attributes['birthdate']
    @id = attributes['id'].to_i
  end

  def self.all
    patients = []
    results = DB.exec("SELECT * FROM patients;")
    results.each do |result|
      current_name = result['name']
      current_birthdate = result['birthdate'].split(" ")[0]
      current_id = result['id'].to_i
      attributes = {'name' => current_name, 'birthdate' => current_birthdate, 'id' => current_id}
      current_patient = Patient.new(attributes)
      patients << current_patient
    end
    patients
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(patient)
    @name==(patient.name) && @birthdate==(patient.birthdate) && @id==(patient.id)
  end

end
