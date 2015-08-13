require("rspec")
require("contact")
require("address")
require("email")
require("phone")

describe(Contact) do
  describe("#initialize") do
    it("creates a new contact with proper parameters") do
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      expect(new_contact.first_name()).to(eq("Justin"))
      expect(new_contact.last_name()).to(eq("Scott"))
      expect(new_contact.title()).to(eq("Dr."))
      expect(new_contact.job_title()).to(eq("Ruby Developer"))
    end
  end
end
