FactoryGirl.define do
  factory :election do
    area
    election_start 30.days.since.beginning_of_day
    election_end 30.days.since.beginning_of_day.advance(days:1)
    post "President"
  end
end
