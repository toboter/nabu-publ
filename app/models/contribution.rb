class Contribution < Project
  
  def self.responsibility_roles
    %w(Author CoAuthor)
  end

  def self.child_types
    %w(Contribution)
  end

end