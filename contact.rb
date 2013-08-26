require "./database"

class Contact
	
	attr_accessor :first_name, :last_name, :email, :phone_number, :company, :note

	def initialize(first_name, last_name, email, phone_number, company, note)
			@first_name = first_name,
			@last_name = last_name,
			@email = email,
			@phone_number = phone_number,
			@company = company,
			@note = note
		}
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

	    contact = Contact.new(first_name, last_name, email, phone_number, company note)
		Databse.add_contact(contact)
	end

	def modify_existing_contact
	    puts "\e[H\e[2J"
	end

	def delete_a_contact
	    puts "\e[H\e[2J"
	end

  	def display_all_contacts
    	puts "\e[H\e[2J"
    	puts Database.contacts[:last_name]
  	end

  	def display_an_attribute
    	puts "\e[H\e[2J"
  	end

	def add_to_database
		Database.add_contact(@contact)
	end
end
