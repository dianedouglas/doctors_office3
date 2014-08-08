class Patient

  attr_reader :name, :birthdate, :id

  def initialize(attributes)
    @name = attributes['name']
    @birthdate = attributes['birthdate'].split(" ")[0]
    @id = attributes['id'].to_i
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
    results = DB.exec("INSERT INTO patients (name, birthdate) VALUES ('#{@name}', '#{@birthdate}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(patient)
    @name==(patient.name) && @birthdate==(patient.birthdate) && @id==(patient.id)
  end

end
