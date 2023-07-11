class OrderHistory
  include ActiveModel::Model
  attr_accessor :zip, :region_id, :municipalities, :house_number, :building_name, :phone_number,
                :user_id, :item_id, :token

  with_options presence: true do
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\z/
    validates    :zip, format: { with: VALID_POSTAL_CODE_REGEX }
    validates    :municipalities
    validates    :house_number
    validates    :phone_number, numericality: { only_integer: true, message: 'is invalid', allow_blank: true },
                                length: { minimum: 10, maximum: 11}
    validates    :user_id
    validates    :item_id
    validates    :token
  end
  validates    :region_id, presence: true, numericality: { other_than: 1, message: "can't be blank", allow_blank: true }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Order.create(zip: zip, region_id: region_id, municipalities: municipalities,house_number: house_number,
      building_name: building_name, phone_number: phone_number, history_id: history.id)
  end
end