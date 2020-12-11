FactoryBot.define do
  factory :sea do
    seaname          {'ももち浜'}
    address          {'福岡市早良区'}
    explanation      { Faker::Lorem.sentence }
    car_id           { 2 }
    shower_id        { 2 }
    area_id          { 2 }
    association :user
    after(:build) do |sea|
      sea.image.attach(io: File.open('public/images/coffee.jpg'),filename: 'coffee.jpg')
    end       
  end
end