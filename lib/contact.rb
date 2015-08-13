class Contact
  @@contacts = []
  @@id_count = 0

  attr_reader(:first_name, :last_name, :title, :job_title, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @title = attributes.fetch(:title)
    @job_title = attributes.fetch(:job_title)
    @@id_count += 1
    @id = @@id_count

  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
    @@id_count = 0
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id() == id
        found_contact = contact
      end
    end
    found_contact
  end

  define_singleton_method(:delete) do |id|
    revised_contacts = []
    @@contacts.each() do |contact|
      if contact.id() != id
        revised_contacts.push(contact)
      end
    end
    @@contacts = revised_contacts
  end

  define_method(:find_phones) do
    Phone.find_by_contact_id(@id)
  end

  define_method(:find_emails) do
    Email.find_by_contact_id(@id)
  end

  define_method(:find_addresses) do
    Address.find_by_contact_id(@id)
  end

end
