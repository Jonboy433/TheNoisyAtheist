class Comment < ActiveRecord::Base
	validates :content, :user_id, :blog_id, presence: true
	
	belongs_to :user
 	belongs_to :blog
end
