class User < ActiveRecord::Base

	validates :auth_token, uniqueness: true
	before_create :generate_authentication_token!

	has_many :products, dependent: :destroy
    has_many :orders, dependent: :destroy

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    def generate_authentication_token!
    	begin
    		self.auth_token = Devise.friendly_token
    	end while self.class.exists?(auth_token: auth_token)
    end
end
