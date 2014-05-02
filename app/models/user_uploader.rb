class UserUploader

require 'csv'

  def initialize(file)
	  CSV.parse(file.read, :headers => true) do |row|
     	 User.create(email: row["email"], name: row["name"], password: row ["password"], password_confirmation: ["password"], image "", admin: false)
    end
  end
end