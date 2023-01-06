# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable
  validates :name, :email, :role, presence: true
end
