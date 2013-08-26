class CRM

  def main_menu
    #puts "\e[H\e[2J"
    print_main_menu
    @user_selected = gets.to_i
    call_option(@user_selected)
    while @user_selected != 6
        main_menu
    end
  end

  def print_main_menu
    puts "\e[H\e[2J"
    puts IO.readlines('crm_logo.txt')
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    print "Please make your option: "
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
        @first_name = first_name
        @last_name = last_name
        @email = email
        @phone_number = phone_number
        @company = company
        @note = note      
    end

    def self.add_new_contact
        puts "\e[H\e[2J"
        puts IO.readlines('new_contact.txt')
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

    def self.modify_existing_contact
        puts "\e[H\e[2J"
        puts IO.readlines('modify.txt')
        puts "------------------------------"
        print "What is the ID of the contact you would like to modify? "
        contact_id_to_modify = gets.chomp.to_i
        print "Please confirm #{contact_id_to_modify} is the correct id (y/n): "
        confirmation_response = gets.chomp.downcase
        if confirmation_response == 'y'
            puts " "
            puts "Please select what information you would like to modify"
            puts "[1] FIRST NAME"
            puts "[2] LAST NAME"
            puts "[3] EMAIL"
            puts "[4] PHONE NUMBER"
            puts "[5] COMPANY NAME"
            puts "[6] NOTES"
            print "Please make your selection: "
            change_attribute = gets.chomp
        else
            Contact.modify_existing_contact
        end

        case change_attribute
        when "1"
            puts ""
            print "What is the new First name: "
            new_first_name = gets.chomp.capitalize
            Database.modify_with_first_name(new_first_name, contact_id_to_modify)
        when "2"
            puts ""
            print "What is the new Last name: "
            new_last_name = gets.chomp.capitalize
            Database.modify_with_last_name(new_last_name, contact_id_to_modify)
        when "3"
            puts ""
            print "What is the new Email address: "
            new_email_address = gets.chomp
            Database.modify_with_new_email(new_email_address, contact_id_to_modify)
        when "4"
            puts ""
            print "What is the new Phone number: "
            new_phone_number = gets.chomp
            Database.modify_new_phone_number = gets.chomp(new_phone_number, contact_id_to_modify)
        when "5"
            puts ""
            print "What is the new Company name: "
            new_company_name = gets.chomp
            Database.modify_new_company_name(new_company_name, contact_id_to_modify)
        when "6"
            puts ""
            print "What is the new Note: "
            new_note = gets.chomp
            new_note = gets.chomp
            Database.modify_with_new_note(new_note contact_id_to_modify)
        end

    end

    def self.delete_a_contact
        puts "\e[H\e[2J"
        puts IO.readlines('delete.txt')
        print "what is the contact id you would like to delete? "
        id_to_delete = gets.chomp.to_i
        puts "Please confirm (y/n) if you would like to delete contact ID #{id_to_delete}"
        response = gets.chomp
        if response = "y"
            Database.delete_contact(id_to_delete)
        else
            application.main_menu
        end
    end

    def self.display_all_contacts
        puts "\e[H\e[2J"
        puts IO.readlines('display.txt')
        Database.display_all_contacts
    end

    def display_an_attribute
        puts "\e[H\e[2J"
    end
end

class Database
    @contacts = []
    @id = 1000

    def self.add_contact(new_contact)
        new_contact.id = @id
        @contacts << new_contact
        @id += 1
        puts "#{new_contact.first_name} #{new_contact.last_name} has been added to the customer database. The ID number is #{new_contact.id}"
    end

    def self.modify_with_first_name(new_first_name, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.first_name = new_first_name if contact.id == contact_id_to_modify 
        end
        puts "First name has been updated to: #{new_first_name}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.modify_with_last_name(new_last_name, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.last_name = new_last_name if contact.id == contact_id_to_modify  
        end
        puts "Last name has been updated to: #{new_last_name}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
        
    end

    def self.modify_with_new_email(new_email_address, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.email = new_email_address if contact.id == contact_id_to_modify 
        end
        puts "Email has been updated to: #{new_email_address}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.modify_new_phone_number(new_phone_number, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.phone_number = new_phone_number if contact.id == contact_id_to_modify 
        end
        puts "Phone number has been updated to: #{new_phone_number}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.modify_new_company_name(new_company_name, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.company = new_compay_name if contact.id == contact_id_to_modify 
        end
        puts "Company name has been updated to: #{new_company_name}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.modify_with_new_note(new_note, contact_id_to_modify)
        puts "------------------------------"
        @contacts.each do |contact| 
            contact.note = new_note if contact.id == contact_id_to_modify 
        end
        puts "Contact note has been updated to: #{new_note}."
        puts "------------------------------"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.delete_contact(id_to_delete)
        @contacts.delete_if {|contact| contact.id == id_to_delete}
        puts "Contact succesfully deleted"
        print "Press any key to return to main menu: "
        response = gets.chomp
    end

    def self.database
        @contacts
    end

    def self.display_all_contacts
        @contacts.each do |contact|
            puts "******************************"
            puts "***** [ID] #{contact.id} *****"
            puts "******************************"
            puts "[FIRST NAME] #{contact.first_name}"
            puts "[LAST NAME] #{contact.last_name}"
            puts "[EMAIL] #{contact.email}"
            puts "[PHONE NUMBER] #{contact.phone_number}"
            puts "[COMPANY] #{contact.company}"
            puts "[NOTES] #{contact.note}"
            puts "******************************"
        end
        print "Press any key to return to main menu: "
        response = gets.chomp
    end
end

application = CRM.new
application.main_menu