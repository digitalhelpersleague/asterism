FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :sip do
    name { "name_#{Time.now.to_f}" }
    callerid 'Jessica'
  end
end
