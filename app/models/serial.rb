class Serial < Project

  def self.responsibility_roles
    %w(Editor Publisher)
  end

  def self.child_types
    %w(Book)
  end

end