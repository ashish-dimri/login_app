class Photo < ApplicationRecord
  belongs_to :album, optional: true

  #Mounts paperclip image
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true, reject_if: :all_blank
end
