require("rspec")
require("contact")
require("address")
require("email")
require("phone")

describe(Contact) do

  before() do
    Contact.clear()
  end

  describe("#initialize") do
    it("creates a new contact with proper parameters") do
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      expect(new_contact.first_name()).to(eq("Justin"))
      expect(new_contact.last_name()).to(eq("Scott"))
      expect(new_contact.title()).to(eq("Dr."))
      expect(new_contact.job_title()).to(eq("Ruby Developer"))
    end
  end

  describe("#save, .all, .clear") do
    it("will display all contacts, save contacts and clear contacts") do
      expect(Contact.all()).to(eq([]))
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("finds a contact by id") do
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      new_contact.save()
      expect(Contact.find(1)).to(eq(new_contact))
      expect(Contact.find(2)).to(eq(nil))
    end
  end

  describe(".delete") do
    it("will delete selected contact") do
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      new_contact.save()
      Contact.delete(1)
      expect(Contact.all()).to(eq([]))
    end
  end
end
