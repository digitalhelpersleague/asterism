FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :ivr do
    context { 'I0001'}
    media { '/tmp/ivrfile.wav' }
  end
end
