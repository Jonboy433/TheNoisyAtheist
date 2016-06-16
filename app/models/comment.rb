class Comment < ActiveRecord::Base
	validates :content, :user_id, :blog_id, presence: true

end
