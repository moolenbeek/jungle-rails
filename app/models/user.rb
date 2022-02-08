class User < ActiveRecord::Base

  # attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = self.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  def self.find_by_email(email)
    trimmed_email = email.gsub(/\s+/, '')
    User.where('lower(email) = ?', trimmed_email.downcase).first
  end

end
