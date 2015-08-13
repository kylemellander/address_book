class Address
  @@addresses = []
  @@id_count = 0

  attr_reader(:address_type, :street, :city, :state, :zipcode, :contact_id, :id)

  define_method(:initialize) do |attributes|
    @address_type = attributes.fetch(:address_type, "")
    @street = attributes.fetch(:street, "")
    @city = attributes.fetch(:city, "")
    @state = attributes.fetch(:state, "")
    @zipcode = attributes.fetch(:zipcode, "")
    @contact_id = attributes.fetch(:contact_id, "")
    @@id_count += 1
    @id = @@id_count
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_singleton_method(:clear) do
    @@addresses = []
    @@id_count = 0
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:find_by_contact_id) do |contact_id|
    found_addresses = []
    @@addresses.each do |address|
      if address.contact_id() == contact_id
        found_addresses.push(address)
      end
    end
    found_addresses
  end

  define_singleton_method(:delete) do |id|
    revised_addresses = []
    @@addresses.each() do |address|
      if address.id() != id
        revised_addresses.push(address)
      end
    end
    @@addresses = revised_addresses
  end

  define_method(:google_maps_link) do
    google_maps_link = "https://www.google.com/maps/place/"
    street_formatted = @street.gsub(' ', "+")
    google_maps_link.concat(street_formatted)
    google_maps_link.concat("+" + @city + "+" + @state + "+" + @zipcode)
  end

  define_singleton_method(:delete_by_contact) do |contact_id|
    revised_addresses = []
    @@addresses.each() do |address|
      if address.contact_id() != contact_id
        revised_addresses.push(address)
      end
    end
    @@addresses = revised_addresses
  end

end
