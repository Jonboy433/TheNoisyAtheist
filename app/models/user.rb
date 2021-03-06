class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:user_id]
  
  validates :user_id,
  	:presence => true,
  	:uniqueness => {
  		:case_sensitive => false
  	}
  validates :email,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }
 
  attr_accessor :login
  
  has_many :blogs
  has_many :comments

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["user_id = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
  end
end
