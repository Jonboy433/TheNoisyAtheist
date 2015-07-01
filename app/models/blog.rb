class Blog < ActiveRecord::Base
	validates :title, presence: true, length: { in: 5..100 }
	validates :content, presence: true, length: { in: 5..500 }
	validates :display_id, presence: true, length: { in: 5..100 }
end
