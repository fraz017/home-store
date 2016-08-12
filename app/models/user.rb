class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable, :confirmable
  include DeviseTokenAuth::Concerns::User
  as_enum :role, admin: 0, seller: 1, buyer: 2

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :products
  validates_presence_of :first_name, :last_name, :mobile_number

  def as_json(options={})
    super(:except => [:provider, :created_at, :updated_at, :role, :role_cd, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :verification_code, :message_id],
    ).merge({:image => self.image.url})
  end
end
