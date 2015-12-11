class Wiki < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :body

  default_scope { order('updated_at ASC') }

  scope :publicly_available, -> {where(private: false)}
end
