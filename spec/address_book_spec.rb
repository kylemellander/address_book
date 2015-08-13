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

  describe("#find_phones") do
    it("finds all phones in contact") do
      new_contact = Contact.new({:first_name => "Justin", :last_name => "Scott", :title => "Dr.", :job_title => "Ruby Developer"})
      new_phone = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      new_phone.save()
      expect(new_contact.find_phones()).to(eq([new_phone]))
    end
  end
end

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#initialize') do
    it('creates a new phone number with proper parameters') do
      new_phone = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      expect(new_phone.phone_type()).to(eq("Home"))
      expect(new_phone.phone_number()).to(eq("503-555-5555"))
      expect(new_phone.contact_id()).to(eq(1))
    end
  end

  describe('#save, .all, .clear') do
    it("will display phone numbers, save phone numbers and clear phone numbers") do
      expect(Phone.all()).to(eq([]))
      new_phone = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      new_phone.save()
      expect(Phone.all()).to(eq([new_phone]))
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".find_by_contact_id") do
    it("finds phones by contact id") do
      new_phone = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      new_phone.save()
      expect(Phone.find_by_contact_id(1)).to(eq([new_phone]))
    end
  end

  describe(".delete") do
    it("deletes a specific phone number") do
      new_phone = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      new_phone.save()
      Phone.delete(1)
      expect(Phone.all()).to(eq([]))
      new_phone.save()
      new_phone2 = Phone.new({:phone_type => "Home", :phone_number => "503-555-5555", :contact_id => 1})
      new_phone2.save()
      Phone.delete(2)
      expect(Phone.all()).to(eq([new_phone]))
    end
  end

end

describe(Address) do
  describe("#initialize") do
    it('will create a new address') do
      new_address = Address.new({:address_type => "Home", :street => "505 S 5th St", :city => "Portland", :state => "Oregon", :zipcode => "98989", :contact_id => 1})
      expect(new_address.address_type()).to(eq("Home"))
      expect(new_address.street()).to(eq("505 S 5th St"))
      expect(new_address.city()).to(eq("Portland"))
      expect(new_address.state()).to(eq("Oregon"))
      expect(new_address.zipcode()).to(eq("98989"))
      expect(new_address.contact_id()).to(eq(1))
    end
  end

end
