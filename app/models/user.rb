# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :lockable

  enum role: { master: 0, admin: 1, general: 2 }

  validates :name, :role, presence: true
  validate :file_size, :file_extension
  has_one_attached :icon 


  private

  def file_size
    # MEMO: attached?とblobとbyte_sizeはActiveStorageのメソッド、megabytesはRailsのメソッド
    return unless icon.attached? && icon.blob.byte_size > 5.megabytes

    errors.add(:icon, 'は5MB以下のファイルをアップロードしてください')
  end

  def file_extension
    if icon.attached? && icon.blob.image? && ['.jpg', '.jpeg',
                                              '.png'].exclude?(File.extname(icon.blob.filename.to_s).downcase)
      errors.add(:icon, 'はJPEGまたはPNG形式のファイルをアップロードしてください')
    end
  end
end
