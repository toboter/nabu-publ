class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  belongs_to :creator, class_name: 'User'

  def self.roles
    %w()
  end
end
