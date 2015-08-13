class Phone
  @@phones = []
  @@id_count = 0

  attr_reader(:phone_type, :phone_number, :contact_id, :id)

  define_method(:initialize) do |attributes|
    @phone_type = attributes.fetch(:phone_type, "")
    @phone_number = attributes.fetch(:phone_number, "")
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

  define_singleton_method(:find_by_contact_id) do |contact_id|
    found_phones = []
    @@phones.each do |phone|
      if phone.contact_id() == contact_id
        found_phones.push(phone)
      end
    end
    found_phones
  end

  define_singleton_method(:delete) do |id|
    revised_phones = []
    @@phones.each() do |phone|
      if phone.id() != id
        revised_phones.push(phone)
      end
    end
    @@phones = revised_phones
  end

  define_singleton_method(:delete_by_content) do |contact_id|
    revised_phones = []
    @@phones.each() do |phone|
      if phone.contact_id() != contact_id
        revised_phones.push(phone)
      end
    end
    @@phones = revised_phones
  end

end
