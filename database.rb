class Database
  @@contacts = []
  @@id = 1000

  def self.add_contact(contact)
    contact[:id] = @id
    @@contacts << contact
    @@id += 1
  end

  def self.contacts
    @@contacts
  end

  def self.display_contacts
    puts self.contacts
  end
  # def find_contact(search_id)
  #   @@contacts.select[search_ id] do
  #     puts "First Name: #{@@contacts[:first_name]}"
  #   end
end
