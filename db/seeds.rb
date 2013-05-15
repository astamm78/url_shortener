require 'faker'

5.times do
  Url.create(:url => Faker::Internet.url)
end
