FactoryBot.define do
  factory :user do
    nickname {"カズキング"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {"福田"}
    first_name {"和寿来"}
    last_name_kana {"フクダ"}
    first_name_kana {"カズキ"}
    birthday {Faker::Date.birthday}
  end
end