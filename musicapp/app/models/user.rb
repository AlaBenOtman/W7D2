class User < ApplicationRecord
validates :email, :session_token, presence: true, uniqueness: true 
validates :password_digest, presence: true
validates :password, length: {minimum: 6, allow_nil: true }
    
end


def self.generate_session_token
     SecureRandom::urlsafe_base64
end

def self.reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save!   #can we say self.session_token.save??
    self.session_token


end

def self.ensure_session_token 
    self.session_token ||= User.generate_session_token
end


