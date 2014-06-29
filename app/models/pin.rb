class Pin < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	# has_attached_file :file_avatar, :default_url => "/files/:style/missing.doc"
	validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
#	validates_attachment :file_avatar, content_type: {content_type: ["application/pdf","application/vnd.ms-excel",     
 #            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
  #           "application/msword", 
   #          "application/vnd.openxmlformats-officedocument.wordprocessingml.document", 
    #         "text/plain"] }
end



