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

end
