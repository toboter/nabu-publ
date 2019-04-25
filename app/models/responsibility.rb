class Responsibility < ApplicationRecord
  attr_accessor :responsable_gid
  self.inheritance_column = :_type_disabled
  
  belongs_to :project
  belongs_to :responsable, polymorphic: true
  belongs_to :creator, class_name: 'User'
  
  before_save :set_as_accepted, if: :creator_responsible?

  scope :accepted, -> { where.not(accepted_at: nil) }
  scope :not_accepted, -> { where(accepted_at: nil) }

  def self.types
    %w(Author CoAuthor Editor Layouter Publisher Creator)
  end

  def creator_responsible?
    responsable == creator
  end

  def set_as_accepted
    self.accepted_at = Time.current
  end
  
  def accepted?
    accepted_at.present?
  end

  def responsable_gid
    responsable
  end

  def responsable_gid=(value)
    self.responsable = GlobalID::Locator.locate(value)
  end

  def responsables
    responsable.users
  end
end
