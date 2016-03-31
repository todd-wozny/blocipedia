class Wiki < ActiveRecord::Base
  belongs_to :user
  
  validates :user, presence: true
  
  #scope :visible_to, -> (user) { user ? all : where(public: true) }
end
