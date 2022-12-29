# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, :role, presence: true
end
