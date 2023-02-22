# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'test' }
    email { 'test@example.com' }
    password { 'password1234' }
    role { 'master' }
  end
end
