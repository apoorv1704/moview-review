class Movie < ActiveRecord::Base
	searchkick
	belongs_to :user
	has_many :reviews


	has_attached_file :image, styles: { medium: "400x600#" }
	:storage => :s3,
    :bucket => " fanatics ",
    :default_url => '/images/:attachment/missing_:style.png',
    :s3_credentials => S3_CREDENTIALS
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
