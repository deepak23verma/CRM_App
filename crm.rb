class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    print_main_menu
    @user_selected = gets.to_i
    call_option(@user_selected)
    while @user_selected != 6
        main_menu
    end
  end

  def print_main_menu
    #puts "\e[H\e[2J"
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    print "Enter a number: "
  end

  def call_option(user_selected)
    Contact.add_new_contact if user_selected == 1
    Contact.modify_existing_contact if user_selected == 2
    Contact.delete_a_contact if user_selected == 3
    Contact.display_all_contacts if user_selected == 4
    Contact.display_an_attribute if user_selected == 5
    exit if user_selected == 6
  end
end

class Contact
    
    attr_accessor :first_name, :last_name, :email, :phone_number, :company, :note, :id

    def initialize(first_name, last_name, email, phone_number, company, note)
            
            @first_name = first_name,
            @last_name = last_name,
            @email = email,
            @phone_number = phone_number,
            @company = company,
            @note = note
    end

    def self.add_new_contact
        puts "\e[H\e[2J"
        print "Enter First Name: "
        first_name = gets.chomp.capitalize
        print "Enter Last Name: "
        last_name = gets.chomp.capitalize
        print "Enter Email Address: "
        email = gets.chomp
        print "Enter phone number: "
        phone_number = gets.chomp
        print "Enter company: "
        company = gets.chomp
        print "Enter a Note: "
        note = gets.chomp

        new_contact = Contact.new(first_name, last_name, email, phone_number, company, note)
        Database.add_contact(new_contact)
    end

    def modify_existing_contact
        puts "\e[H\e[2J"
    end

    def delete_a_contact
        puts "\e[H\e[2J"
    end

    def self.display_all_contacts
        Database.contacts[0..6].each {|x| puts x}
    end

    def display_an_attribute
        puts "\e[H\e[2J"
    end
end

class Database
  @contacts = []
  @id = 1000

  def self.add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  # def self.contacts
  #   @contacts
  # end
end

CRM = CRM.new("Buyers are Liars! Happy Selling!!")
CRM.main_menu