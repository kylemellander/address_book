class Email
  @@emails = []
  @@id_count = 0

  attr_reader(:email_type, :email_address, :contact_id, :id)

  define_method(:initialize) do |attributes|
    @email_type = attributes.fetch(:email_type, "")
    @email_address = attributes.fetch(:email_address, "")
    @contact_id = attributes.fetch(:contact_id)
    @@id_count += 1
    @id = @@id_count
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_singleton_method(:clear) do
    @@emails = []
    @@id_count = 0
  end

  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:find_by_contact_id) do |contact_id|
    found_emails = []
    @@emails.each do |email|
      if email.contact_id() == contact_id
        found_emails.push(email)
      end
    end
    found_emails
  end

  define_singleton_method(:delete) do |id|
    revised_emails = []
    @@emails.each() do |email|
      if email.id() != id
        revised_emails.push(email)
      end
    end
    @@emails = revised_emails
  end

end
