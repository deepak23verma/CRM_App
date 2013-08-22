class Database
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact[:id] = @id
    @contacts << contact
    @id += 1
    p contacts
  end

  def self.contacts
    @contacts
  end
end
