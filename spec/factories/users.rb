# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'password1234' }
    role { 'master' }

    after(:build) do |user|
      file = Rails.root.join('spec/fixtures/sample.jpeg').open
      user.icon.attach(io: file, filename: 'sample.jpeg', content_type: 'image/jpeg')
    end

    organization
  end
end
