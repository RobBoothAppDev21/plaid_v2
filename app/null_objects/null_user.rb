# frozen_string_literal: true

class NullUser
  
  def email
    "null_user@null_example.com"
  end

  def authenticate(password)
    false
  end

  def items
    []
  end
  
  def accounts
    []
  end

end