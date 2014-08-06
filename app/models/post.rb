class Post < ActiveRecord::Base
	validates :title, uniqueness:true, presence: true
	validates :content, uniqueness:true, presence: true
end
