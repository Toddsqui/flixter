class Lesson < ActiveRecord::Base
	belongs_to :section
	belongs_to :user
	mount_uploader :video, VideoUploader
end
