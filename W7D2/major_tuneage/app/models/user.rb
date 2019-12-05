class User < ApplicationRecord

    attr_accessor :password
    
    validates :email, presence: true
    validates :password, length: {minimum: 6}

    after_initialize :ensure_session_token

    def self.generate_session_token
        SecureRandom.urlsafe_base64
    end

    def self.find_by_credentials(email, password)
        #finds user by email, and checks validity of password
        #no access to params in model! 
        #want to return the user
        user = User.find_by(email: email)
        if user.is_password?(password)
            user
        else   
            nil
        end
    end

    def reset_session_token
        #sets new session token
        self.session_token = User.generate_session_token
        #save user's session token to DB
        self.save
        self.session_token
    end

    def ensure_session_token
        #only sets session token if it's not already set
        self.session_token ||= User.generate_session_token
    end

    def password=(password)
        #user passes in password, sets pw digest to string
        #Password.create creates a string
        #Password.new creates a BCrypt Password instance
        #need to create an instance of a password here because we don't have a
        #column 
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        #this is different from BCrypt::Password.is_password?
        #this is an instance method to check validity of user's password
        #it leverages BCrypt::Password.is_password?
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end
