FactoryGirl.define do
  to_create { |instance| instance.save }

  factory :extension do
    exten { 's' }
    priority { 1 }
    context { 'TestExtension' }
    app { 'NoOp' }
    appdata { 'TestExtension' }
  end
end
