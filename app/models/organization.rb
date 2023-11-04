# frozen_string_literal: true

class Organization < ApplicationRecord
  #常にorganizationモデルに適応される条件を記述
  default_scope { where(discarded_at: nil) }

  has_many :users, dependent: :destroy

  validates :name, presence: true
end
