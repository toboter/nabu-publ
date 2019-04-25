class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  has_many :responsibilities, as: :responsable
  has_many :projects, through: :responsibilities

  
end
