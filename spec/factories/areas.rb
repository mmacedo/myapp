FactoryGirl.define do
  factory :area do
    sequence(:name) {|i| "US#{i}" }
    type "Country"
  end
end
