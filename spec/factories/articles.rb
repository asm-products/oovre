require 'faker'

FactoryGirl.define do

  factory :article do
    title "Some Random Content Title"
    subtitle "this is where it starts"
    content "<p>some random content here</p><p><br></p>"
  end

end 