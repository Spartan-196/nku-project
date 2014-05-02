class CustomerUploader

require 'csv'

  def initialize(file)
	  CSV.parse(file.read, :headers => true) do |row|
     	if @customer= Customer.find_by_email(row["email"])
        Customer.create(company_name: row["company_name"], first_name: row["first_name"], last_name: row["last_name"], email: row["email"], phone: row["phone"], address_1: row["address_1"], address_2: row["address_2"], city: row["city"], state: row["state"], zip: row["zip"])
      end
    end
  end
end