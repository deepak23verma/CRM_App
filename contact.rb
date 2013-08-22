require "./database"

class Contact
	def initialize(first_name, last_name, email, phone_number, company, note)
		@contact = {
			:first_name => first_name,
			:last_name => last_name,
			:email => email,
			:phone_number => phone_number,
			:company => company,
			:note => note
		}
	end

	def add_to_database
		Database.add_contact(@contact)
	end
end
