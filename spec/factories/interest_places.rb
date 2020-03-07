FactoryBot.define do
  factory :interest_place do
    name { FFaker::Name.name }
    x { 1 }
    y { 1 }
    opened { "07:00" }
    closed { "18:00" }
  end
end
