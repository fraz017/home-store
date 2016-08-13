class Photo < ActiveRecord::Base
	belongs_to :product
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ 

  def as_json(options={})
    super(:except => [:created_at, :updated_at, :product_id, :image_file_name, :image_content_type, :image_file_size, :image_updated_at]).merge({:image => self.image.url})
  end
end
