class Specialty

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def save
    results = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    specialties = []
    results = DB.exec("SELECT * FROM specialties;")
    results.each do |specialty_row|
      current_specialty = Specialty.new(specialty_row)
      specialties << current_specialty
    end
    specialties
  end

  def ==(another_specialty)
    @name == another_specialty.name && @id == another_specialty.id
  end

  def specialty_sort
    results = DB.exec("SELECT * FROM doctors WHERE specialty_id = '#{@id}';")
    sorted_docs = []
    results.each do |result|
      current_doc = Doctor.new(result)
      sorted_docs << current_doc
    end
    sorted_docs
  end
end
