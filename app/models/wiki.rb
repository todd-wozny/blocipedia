class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations
  
  validates :user, presence: true
  
  #scope :visible_to, -> (user) { user ? all : where(public: true) }
end
