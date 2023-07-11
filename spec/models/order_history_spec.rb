require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_history = FactoryBot.build(:order_history, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "zip、region_id、municipalities、house_number、phone_number、tokenがあれば保存ができること" do
      expect(@order_history).to be_valid
    end
    it "building_nameが空でも登録できること" do
      @order_history.building_name = ""
      expect(@order_history).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order_history.token = nil
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Token can't be blank")
    end
    it "zipが空では登録できないこと" do
      @order_history.zip = ""
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Zip can't be blank")
    end
    it "zipは「3桁ハイフン4桁」の半角文字列以外では登録できないこと" do
      @order_history.zip = "123-45"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include('Zip is invalid')
    end
    it "region_idが空では登録できないこと" do
      @order_history.region_id = ""
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Region can't be blank")
    end
    it 'region_idに「---」が選択されている場合は登録できないこと' do
      @order_history.region_id = "1"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Region can't be blank")
    end
    it "municipalitiesが空では登録できないこと" do
      @order_history.municipalities = ""
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Municipalities can't be blank")
    end
    it "house_numberが空では登録できないこと" do
      @order_history.house_number = ""
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空では登録できないこと" do
      @order_history.phone_number = ""
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberは10桁より少ないと登録できないこと" do
      @order_history.phone_number = "090123456"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include ('Phone number is too short (minimum is 10 characters)')
    end
    it "phone_numberは11桁より多いと登録できないこと" do
      @order_history.phone_number = "090123456789"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include ('Phone number is too long (maximum is 11 characters)')
    end
    it "phone_numberは半角数字以外だと登録できないこと" do
      @order_history.phone_number = "０９０１２３４５６７"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include('Phone number is invalid')
    end
    it "phone_numberは英数混合だと登録できないこと" do
      @order_history.phone_number = "aaa00000000"
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include('Phone number is invalid')
    end
    it 'user_id（購入者）が空だと登録できないこと' do
      @order_history.user_id = nil
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("User can't be blank")
    end
    it 'item_id（購入商品）が空だと登録できないこと' do
      @order_history.item_id = nil
      @order_history.valid?
      expect(@order_history.errors.full_messages).to include("Item can't be blank")
    end
  end
end