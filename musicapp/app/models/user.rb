class User < ApplicationRecord
validates :email, :session_token, presence: true, uniqueness: true 
validates :password_digest, presence: true
validates :password, length: {minimum: 6, allow_nil: true }

    after_initialize :ensure_session_token 

    attr_reader :password 


def self.generate_session_token
     SecureRandom::urlsafe_base64
end

def reset_session_token! 
    self.session_token = User.generate_session_token 
    self.save!   #can we say self.session_token.save??
    self.session_token


end

def ensure_session_token 
    self.session_token ||= User.generate_session_token
end

def password=(password) 
    self.password_digest = Bcrypt::Password.create(password)
    @password = password 
end

def is_password?(password) #to check the user's password when they login
    password_obj = Bcrypt::Password.create(self.password_digest)
    password_obj.is_password?(password)
end

  def self.find_by_credentials(email,password) 
    #to find the specific user and check if the user exist and if the password is right .then we return the user else nil ( this method is made for the create section inside the controller )
    user = User.find_by(email: email)
    if user && user.is_password?(password)
        user 
    else 
        nil 
    end


  end



end
