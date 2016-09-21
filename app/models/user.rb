class User < ApplicationRecord
	validates :name, presence: true
	# can't create a user without name
	#validates :uid, :uniqueness => true
	#users who sign in can't have the same id 
	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth["uid"]
			user.name = auth["extra"]["raw_info"]["login"]

		end
	end
end
