class PostDatum < ApplicationRecord
  belongs_to :user
  has_one_attached :image

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
