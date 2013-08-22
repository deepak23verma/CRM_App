require "./contact"
require "./database"

class CRM

  def initialize(name)
    @name = name
  end

  def main_menu
    print_main_menu
    @user_selected = gets.to_i
    call_option(@user_selected)
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute" 
    puts "[6] Exit"
    print "Enter a number: "
  end

  def call_option(user_selected)
    add_new_contact if user_selected == 1
    modify_existing_contact if user_selected == 2
    delete_a_contact if user_selected == 3
    display_a_contact if user_selected == 4
    display_an_attribute if user_selected == 5
    exit if user_selected == 6
  end

  def add_new_contact
    print "Enter First Name: "
    @first_name = gets.chomp.capitalize
    print "Enter Last Name: "
    @last_name = gets.chomp.capitalize
    print "Enter Email Address: "
    @email = gets.chomp
    print "Enter phone number: "
    @phone_number = gets.chomp
    print "Enter company: "
    @company = gets.chomp
    print "Enter a Note: "
    @note = gets.chomp
    new_contact = []
    new_contact = Contact.new(@first_name, @last_name, @email, @phone_number, @company, @note)
    new_contact.add_to_database
  end
end

CRM = CRM.new("Buyers are Liars! Happy Selling!!")
CRM.main_menu