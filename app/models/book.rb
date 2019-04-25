class Book < Project
  
  def self.responsibility_roles
    %w(Author CoAuthor Editor Layouter Publisher)
  end

  def self.child_types
    %w(Contribution)
  end
  
end