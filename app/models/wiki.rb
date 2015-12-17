class Wiki < ActiveRecord::Base

  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  validates_presence_of :title, :body

  default_scope { order('updated_at DESC') }

  scope :publicly_available, -> {where(private: false)}

  def collaborator_for(user)
    collaborators.find_by(user: user) # returns the collaborator object for this user/wiki combination
  end
end
