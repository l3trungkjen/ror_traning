class User < ActiveRecord::Base
    has_many :entries, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :user_comments, dependent: :destroy
    validates :email, :password, presence: true, length: {
        minimum: 6,
        maximum: 50,
        too_short: 'Must have at least %{count} characters',
        too_long: 'Must have at most %{count} characters'
    }
end
