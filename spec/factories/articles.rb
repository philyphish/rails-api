FactoryBot.define do

  sequence :slug do |n|
    "sample-article#{n}"
  end

  factory :article do
    title { "Sample title" }
    content { "Sample content" }
    slug { generate :slug }
  end
end
