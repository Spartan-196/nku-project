require 'digest'

class User < ActiveRecord::Base
  has_many :invoices
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  validates :email, uniqueness: true
  has_secure_password
  validates_presence_of :password, :on => :create
  def image_url_with_fallback
    if image.present?
      image
    elsif email
      "http://gravatar.com/avatar/"+Digest::MD5.hexdigest(email)+"?d=mm"
    end
  end

  def self.admin?
    if self.admin == true
      true
    end
  end


end
