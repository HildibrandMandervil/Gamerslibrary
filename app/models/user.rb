class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :post_data, dependent: :destroy
  has_one_attached :profile_image
  has_one_attached :image
  validates :name, length: { minimum: 1, maximum: 12}

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/user.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
   profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/game.png')
      image.attach(io: File.open(file_path), filename: 'default2-image.png', content_type: 'image/png')
    end
   image.variant(resize_to_limit: [width, height]).processed
  end


end
