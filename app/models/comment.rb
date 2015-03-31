class Comment < ActiveRecord::Base
    belongs_to :entry
    has_many :user_comments, dependent: :destroy
end
