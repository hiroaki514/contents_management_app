# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    body { 'テスト投稿の本文' }

    user
  end
end
