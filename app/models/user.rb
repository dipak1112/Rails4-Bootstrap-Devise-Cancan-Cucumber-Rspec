class User < ActiveRecord::Base
	rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:omniauthable
	
	#attr_accessible :role_ids, :as => :admin
	
	 ## instance methods ""
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
 
  user = User.where(:provider => auth.provider, :uid => auth.uid).first
  if user
    return user
  else
    registered_user = User.where(:email => auth.uid + "@twitter.com").first
    if registered_user
      return registered_user
    else
      user = User.create(
        provider:auth.provider,
        uid:auth.uid,
        email:auth.uid+"@twitter.com",
        password:Devise.friendly_token[0,20]
      )
    end
  end
end         
end
