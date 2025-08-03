class User < ApplicationRecord

    devise :database_authenticatable, :registerable,
    rememberable, :validatable

    has_one :bio, dependent: :destroy
end