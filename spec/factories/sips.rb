FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :sip do
    name { Faker::Name.name }
    number { Faker::PhoneNumber.subscriber_number }
    secret { Faker::Internet.password }
  end
end
