class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
  validates :shipping_fee_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
  validates :region_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
  validates :lead_time_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true, message: 'is out of setting range', allow_blank: true },
                    format: { with: /\A[0-9]+\z/, allow_blank: true }
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :region
  belongs_to :lead_time
end
