class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true
  validates :body, presence: true

    

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/game.png')
      image.attach(io: File.open(file_path), filename: 'default2-image.png', content_type: 'image/png')
    end
   image.variant(resize_to_limit: [width, height]).processed
  end
end
