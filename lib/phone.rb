class Phone
  @@phones = []
  @@id_count = 0
  
  attr_reader(:phone_type, :phone_number, :contact_id, :id)

  define_method(:initialize) do |attributes|
    @phone_type = attributes.fetch(:phone_type)
    @phone_number = attributes.fetch(:phone_number)
    @contact_id = attributes.fetch(:contact_id)
    @@id_count += 1
    @id = @@id_count
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_singleton_method(:clear) do
    @@phones = []
    @@id_count = 0
  end

  define_method(:save) do
    @@phones.push(self)
  end

end
