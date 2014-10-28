FactoryGirl.define do
  factory :router do
    context 'Router01'
    routes [{ exten: '_X200', priority: 1}, {exten: '_X100', priority: 2}]
  end
end
