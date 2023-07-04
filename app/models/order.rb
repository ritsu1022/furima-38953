class Order < ApplicationRecord
  belongs_to   :history

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :region

end
