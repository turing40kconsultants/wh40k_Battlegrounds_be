FactoryBot.define do
  factory :model do
    name { "MyString" }
    movement { 1 }
    toughness { 1 }
    sv { 1 }
    invul_sv { 1 }
    wounds { 1 }
    original_wounds { 1 }
    leadership { 1 }
    objective_control { 1 }
    abilities { "MyText" }
  end
end
