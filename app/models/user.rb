class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships

  has_many :responsibilities, as: :responsable
  has_many :projects, through: :responsibilities
  
  def name
    self[:name].presence || email
  end

  def users
    [self]
  end
end
