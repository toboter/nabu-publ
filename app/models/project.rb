class Project < ApplicationRecord
  has_closure_tree
  attr_accessor :proposal

  belongs_to :creator, class_name: 'User'
  has_many :responsibilities, dependent: :destroy
  # has schedule
  # has todos through todo lists
  # has messages
  # has documents = folders in folders and versioned file attachments

  accepts_nested_attributes_for :responsibilities, allow_destroy: true

  scope :books, -> { where type: 'Book' }
  scope :contributions, -> { where type: 'Contribution' }
  scope :serials, -> { where type: 'Serial' }

  def self.types
    %w(Serial Book Contribution)
  end

  def current_title
    title.presence || working_title
  end

end

# current state (reports): from open todos, calculted from external hook

# inhalte / uploads per project
# Book: frontmatter, klappentext, inhalt, biblio, bilder, formatanweisungen || special attributes: isbn
# Contrib: inhalt, bilder, biblio
# Serial: klappentext, formatanweisungen || special attributes: issn