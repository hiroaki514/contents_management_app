# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'password1234' }
    role { 'master' }

    after(:build) do |user|
      user.icon.attach(io: Rails.root.join('spec/fixtures/sample.jpg'), filename: 'sample.jpg',
                       content_type: 'image/jpg')
    end
  end
end
