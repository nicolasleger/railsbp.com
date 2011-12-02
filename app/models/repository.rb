class Repository < ActiveRecord::Base
  has_many :builds
  belongs_to :user

  validates :github_id, :presence => true, :uniqueness => true

  def unique_name
    "#{user.email}/#{self.name}"
  end

  def generate_build
    builds.create
  end
end