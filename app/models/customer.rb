class Customer < ActiveRecord::Base
  has_many :invoices
  #validates_associated :invoices
  validates :last_name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: /\A[^@]+@[^@]+\z/} #{message: "must enter valid email address"}}
  validates :email, confirmation: true #{ message: "must confirm email" }
  validates  :address_1, presence: true
  validates  :city, presence: true
  validates  :state, presence: true
  validates  :zip, presence: true, length: { minimum: 5 }

	def self.admin?
  	  if self.admin == true
    	  true
    	end
 	 end

end