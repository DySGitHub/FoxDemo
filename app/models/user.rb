class User < ApplicationRecord
     before_save { self.email = email.downcase }
    has_many :microposts, dependent: :destroy 
     validates :name, presence: true, length: { in: 9..30 }
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      validates :email, presence: true, 
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
      validates :password, presence: true, length: { minimum: 6 }
      has_secure_password
    
     def feed
        Micropost.where("user_id = ?", id)
      end  
end
