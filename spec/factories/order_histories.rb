FactoryBot.define do
  factory :order_history do
    zip             {"111-1111"}
    region_id       {2}
    municipalities  {"市"}
    house_number    {"あ"}
    building_name   {"あ"}
    phone_number    {"00000000000"}
    token           {"tok_abcdefghijk00000000000000000"}

  end
end
