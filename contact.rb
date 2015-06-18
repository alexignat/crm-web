class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @note = note
  end
end