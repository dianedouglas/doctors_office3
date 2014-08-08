class Doctor

  attr_reader :name, :specialty_id, :insurance_id, :id

  def initialize(attributes)
    @name = attributes['name']
    @specialty_id = attributes['specialty_id'].to_i
    @insurance_id = attributes['insurance_id'].to_i
    @id = attributes['id'].to_i
  end
end
