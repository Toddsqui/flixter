class Lesson < ActiveRecord::Base
	belongs_to :section
	belongs_to :user
	mount_uploader :video, VideoUploader

	#include RankedModel functionality from the RankedModel gem. This will be pulled into the lessons model
	include RankedModel
	ranks :row_order, :with_same => :section_id
end
