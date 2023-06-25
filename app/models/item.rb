class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { message: "can't be blank" }
  validates :shipping_fee_id, presence: true, numericality: { message: "can't be blank" }
  validates :region_id, presence: true, numericality: { message: "can't be blank" }
  validates :lead_time_id, presence: true, numericality: { message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }, format: { with: /\A[0-9]+\z/ }
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
