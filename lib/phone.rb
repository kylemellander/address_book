class Phone
  attr_reader(:phone_type, :phone_number, :contact_id, :id)
  @@id_count = 0

  define_method(:initialize) do |attributes|
    @phone_type = attributes.fetch(:phone_type)
    @phone_number = attributes.fetch(:phone_number)
    @contact_id = attributes.fetch(:contact_id)
    @@id_count += 1
    @id = @@id_count
  end
end
