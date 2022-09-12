class User < ApplicationRecord
  before_create :confirmation_token
  has_secure_password
  validates :first_name,  presence: true  
  validates :last_name,  presence: true  
  validates :email,  presence: true,  uniqueness: true,  format: {   with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i  }

def to_s  
"#{first_name} #{last_name}"  
end  

def email_activate
  self.email_confirmed = true
  self.confirm_token = nil
  save!(:validate => false)
end

private
def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
end



end
