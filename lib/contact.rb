class Contact
  @@contacts = []

  attr_reader(:first_name, :last_name, :title, :job_title)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @title = attributes.fetch(:title)
    @job_title = attributes.fetch(:job_title)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_method(:save) do
    @@contacts.push(self)
  end
end
