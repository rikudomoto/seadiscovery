class Sea < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :car
  belongs_to_active_hash :shower
  belongs_to_active_hash :area
  belongs_to :user
  has_one_attached :image

  validates :image, :seaname, :explanation, :address,    presence: true

  validates :area_id, :car_id, :shower_id,    numericality: {other_than: 1}
end
